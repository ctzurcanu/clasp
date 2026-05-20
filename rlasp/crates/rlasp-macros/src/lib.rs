//! Procedural macros for rlasp
//!
//! Provides `#[lisp_fn]` to expose Rust functions to Lisp

use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, FnArg, ItemFn, Pat, ReturnType};

/// Expose a Rust function to Lisp
///
/// # Example
/// ```ignore
/// #[lisp_fn]
/// pub fn add(a: i64, b: i64) -> i64 {
///     a + b
/// }
/// ```
///
/// This generates:
/// - A wrapper function that converts Lisp arguments to Rust types
/// - Registration code to make the function callable from Lisp
/// - Automatic conversion of return values back to Lisp
#[proc_macro_attribute]
pub fn lisp_fn(_attr: TokenStream, item: TokenStream) -> TokenStream {
    let input = parse_macro_input!(item as ItemFn);

    let fn_name = &input.sig.ident;
    let fn_vis = &input.vis;
    let fn_block = &input.block;
    let fn_attrs = &input.attrs;

    // Extract parameter names and types
    let params: Vec<_> = input
        .sig
        .inputs
        .iter()
        .filter_map(|arg| {
            if let FnArg::Typed(pat_type) = arg {
                if let Pat::Ident(pat_ident) = &*pat_type.pat {
                    Some((pat_ident.ident.clone(), pat_type.ty.clone()))
                } else {
                    None
                }
            } else {
                None
            }
        })
        .collect();

    let param_names: Vec<_> = params.iter().map(|(name, _)| name).collect();
    let param_types: Vec<_> = params.iter().map(|(_, ty)| ty).collect();
    let param_count = params.len();

    // Extract return type
    let return_type = match &input.sig.output {
        ReturnType::Default => quote! { () },
        ReturnType::Type(_, ty) => quote! { #ty },
    };

    // Generate the original function
    let original_fn = quote! {
        #(#fn_attrs)*
        #fn_vis fn #fn_name(#(#param_names: #param_types),*) -> #return_type {
            #fn_block
        }
    };

    // Generate wrapper function name
    let wrapper_name = syn::Ident::new(&format!("{}_lisp_wrapper", fn_name), fn_name.span());

    // Generate registration function name
    let register_name = syn::Ident::new(&format!("register_{}", fn_name), fn_name.span());

    // Convert function name to Lisp naming convention (kebab-case)
    let lisp_name = fn_name.to_string().replace('_', "-");

    // Generate argument extraction code
    let arg_extractions = param_names.iter().zip(param_types.iter()).enumerate().map(|(i, (name, ty))| {
        quote! {
            let #name = <#ty>::from_lisp(args[#i])
                .map_err(|e| format!("Argument {} ({}) conversion failed: {:?}", #i, stringify!(#name), e))?;
        }
    });

    // Generate wrapper that converts Lisp args to Rust and back
    let wrapper_fn = quote! {
        #[doc(hidden)]
        pub fn #wrapper_name(args: &[::rlasp_runtime::LispObject]) -> Result<::rlasp_runtime::LispObject, String> {
            use ::rlasp_ffi::types::{FromLisp, ToLisp};

            // Check arity
            if args.len() != #param_count {
                return Err(format!("Wrong number of arguments to {}: expected {}, got {}",
                    #lisp_name, #param_count, args.len()));
            }

            // Convert arguments
            #(#arg_extractions)*

            // Call original function
            let result = #fn_name(#(#param_names),*);

            // Convert result back to Lisp
            Ok(result.to_lisp())
        }
    };

    // Generate registration function
    let register_fn = quote! {
        #[doc(hidden)]
        pub fn #register_name() -> (&'static str, fn(&[::rlasp_runtime::LispObject]) -> Result<::rlasp_runtime::LispObject, String>) {
            (#lisp_name, #wrapper_name)
        }
    };

    // Combine everything
    let expanded = quote! {
        #original_fn
        #wrapper_fn
        #register_fn
    };

    TokenStream::from(expanded)
}
