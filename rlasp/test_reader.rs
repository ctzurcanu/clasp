use rlasp_reader;
use rlasp_runtime::LispObject;

fn main() {
    let result = rlasp_reader::read_from_string("(+ 1 2)");
    match result {
        Ok(obj) => {
            println!("Read successfully");
            println!("Is cons: {}", obj.is_cons());
            println!("Is nil: {}", obj.is_nil());
            println!("Is fixnum: {}", obj.is_fixnum());
            println!("Is general: {}", obj.is_general());

            if obj.is_cons() {
                if let Some(cons_ptr) = obj.as_cons_ptr() {
                    println!("Cons ptr: {:p}", cons_ptr);
                    if !cons_ptr.is_null() {
                        let cons = unsafe { &*cons_ptr };
                        let car = cons.car();
                        println!("Car is general: {}", car.is_general());
                        println!("Car is fixnum: {}", car.is_fixnum());

                        if car.is_general() {
                            use rlasp_runtime::Symbol;
                            if let Some(sym_ptr) = car.as_general_ptr::<Symbol>() {
                                println!("Symbol ptr: {:p}", sym_ptr);
                                if !sym_ptr.is_null() {
                                    let sym = unsafe { &*sym_ptr };
                                    println!("Symbol name: {}", sym.name());
                                } else {
                                    println!("Symbol ptr is null!");
                                }
                            } else {
                                println!("Could not get symbol ptr");
                            }
                        }
                    } else {
                        println!("Cons ptr is null!");
                    }
                } else {
                    println!("Could not get cons ptr");
                }
            }
        }
        Err(e) => {
            println!("Error: {}", e);
        }
    }
}
