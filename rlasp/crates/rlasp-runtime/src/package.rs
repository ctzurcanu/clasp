//! Package system for Common Lisp
//!
//! Implements CL packages with symbol tables and interning

use crate::object::LispObject;
use crate::symbol::Symbol;
use parking_lot::RwLock;
use std::collections::HashMap;
use std::sync::Arc;

/// Package structure
#[repr(C, align(4))]
pub struct Package {
    /// Type header
    header: crate::header::TypeHeader,

    /// Package name
    name: Arc<str>,

    /// Symbol table (maps symbol names to symbols)
    symbols: RwLock<HashMap<String, LispObject>>,

    /// List of packages to use
    use_list: RwLock<Vec<Arc<Package>>>,
}

impl Package {
    /// Create a new package
    pub fn new(name: impl Into<Arc<str>>) -> Self {
        Self {
            header: crate::header::TypeHeader::new(crate::header::ObjectType::Package),
            name: name.into(),
            symbols: RwLock::new(HashMap::new()),
            use_list: RwLock::new(Vec::new()),
        }
    }

    /// Get package name
    pub fn name(&self) -> &str {
        &self.name
    }

    /// Intern a symbol in this package
    pub fn intern(&self, name: &str) -> LispObject {
        let mut symbols = self.symbols.write();

        // Check if symbol already exists
        if let Some(&sym) = symbols.get(name) {
            return sym;
        }

        // Create new symbol
        let symbol = Symbol::allocate(name);
        symbols.insert(name.to_string(), symbol);
        symbol
    }

    /// Find a symbol in this package (returns None if not found)
    pub fn find_symbol(&self, name: &str) -> Option<LispObject> {
        self.symbols.read().get(name).copied()
    }

    /// Allocate a package and return Arc
    pub fn allocate(name: impl Into<Arc<str>>) -> Arc<Package> {
        Arc::new(Package::new(name))
    }
}

/// Global package manager
pub struct PackageManager {
    /// Map of package names to packages
    packages: RwLock<HashMap<String, Arc<Package>>>,

    /// Current package
    current_package: RwLock<Arc<Package>>,
}

impl PackageManager {
    /// Create a new package manager with default packages
    pub fn new() -> Self {
        let packages = RwLock::new(HashMap::new());

        // Create default packages
        let cl_package = Package::allocate("COMMON-LISP");
        let cl_user_package = Package::allocate("COMMON-LISP-USER");
        let keyword_package = Package::allocate("KEYWORD");
        let system_package = Package::allocate("SYSTEM");
        let core_package = Package::allocate("CORE");

        let mut pkg_map = HashMap::new();
        pkg_map.insert("COMMON-LISP".to_string(), Arc::clone(&cl_package));
        pkg_map.insert("CL".to_string(), cl_package); // nickname
        pkg_map.insert("COMMON-LISP-USER".to_string(), Arc::clone(&cl_user_package));
        pkg_map.insert("CL-USER".to_string(), Arc::clone(&cl_user_package)); // nickname
        pkg_map.insert("KEYWORD".to_string(), keyword_package);
        pkg_map.insert("SYSTEM".to_string(), Arc::clone(&system_package));
        pkg_map.insert("SYS".to_string(), system_package); // nickname
        pkg_map.insert("CORE".to_string(), core_package);

        *packages.write() = pkg_map;

        Self {
            packages,
            current_package: RwLock::new(cl_user_package),
        }
    }

    /// Get or create a package
    pub fn find_or_create_package(&self, name: &str) -> Arc<Package> {
        let name_upper = name.to_uppercase();

        // Check if package exists
        {
            let packages = self.packages.read();
            if let Some(pkg) = packages.get(&name_upper) {
                return Arc::clone(pkg);
            }
        }

        // Create new package
        let new_pkg = Package::allocate(name);
        self.packages.write().insert(name_upper, Arc::clone(&new_pkg));
        new_pkg
    }

    /// Set current package
    pub fn set_current_package(&self, name: &str) -> Result<(), String> {
        let pkg = self.find_or_create_package(name);
        *self.current_package.write() = pkg;
        Ok(())
    }

    /// Get current package
    pub fn current_package(&self) -> Arc<Package> {
        Arc::clone(&*self.current_package.read())
    }

    /// Intern a symbol in the current package
    pub fn intern(&self, name: &str) -> LispObject {
        let pkg = self.current_package();
        pkg.intern(name)
    }

    /// Intern a symbol in a specific package
    pub fn intern_in_package(&self, package_name: &str, symbol_name: &str) -> LispObject {
        let pkg = self.find_or_create_package(package_name);
        pkg.intern(symbol_name)
    }
}

impl Default for PackageManager {
    fn default() -> Self {
        Self::new()
    }
}

/// Global package manager instance
use lazy_static::lazy_static;

lazy_static! {
    pub static ref PACKAGE_MANAGER: PackageManager = PackageManager::new();
}
