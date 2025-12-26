/// AST nodes for C++ class descriptions
#[derive(Debug, Clone)]
pub struct CppClass {
    pub name: String,
    pub methods: Vec<CppMethod>,
    pub constructors: Vec<CppConstructor>,
    pub destructor: bool,
}

#[derive(Debug, Clone)]
pub struct CppMethod {
    pub name: String,
    pub return_type: String,
    pub params: Vec<CppParam>,
    pub is_static: bool,
    pub is_const: bool,
}

#[derive(Debug, Clone)]
pub struct CppConstructor {
    pub params: Vec<CppParam>,
}

#[derive(Debug, Clone)]
pub struct CppParam {
    pub name: String,
    pub type_name: String,
}

impl CppClass {
    pub fn new(name: impl Into<String>) -> Self {
        Self {
            name: name.into(),
            methods: Vec::new(),
            constructors: Vec::new(),
            destructor: true,
        }
    }

    pub fn add_method(&mut self, method: CppMethod) -> &mut Self {
        self.methods.push(method);
        self
    }

    pub fn add_constructor(&mut self, constructor: CppConstructor) -> &mut Self {
        self.constructors.push(constructor);
        self
    }
}

impl CppMethod {
    pub fn new(name: impl Into<String>, return_type: impl Into<String>) -> Self {
        Self {
            name: name.into(),
            return_type: return_type.into(),
            params: Vec::new(),
            is_static: false,
            is_const: false,
        }
    }

    pub fn param(mut self, name: impl Into<String>, type_name: impl Into<String>) -> Self {
        self.params.push(CppParam {
            name: name.into(),
            type_name: type_name.into(),
        });
        self
    }

    pub fn static_method(mut self) -> Self {
        self.is_static = true;
        self
    }

    pub fn const_method(mut self) -> Self {
        self.is_const = true;
        self
    }
}

impl CppConstructor {
    pub fn new() -> Self {
        Self { params: Vec::new() }
    }

    pub fn param(mut self, name: impl Into<String>, type_name: impl Into<String>) -> Self {
        self.params.push(CppParam {
            name: name.into(),
            type_name: type_name.into(),
        });
        self
    }
}
