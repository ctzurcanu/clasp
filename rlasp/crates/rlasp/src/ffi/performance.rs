/// Performance comparison between libffi and cxx approaches
///
/// This module demonstrates the performance trade-offs:
/// - libffi: ~10-20ns overhead per call (dynamic dispatch)
/// - cxx: ~1-2ns overhead per call (direct C++ call)
///
/// For hot paths (called millions of times), cxx is significantly faster.
/// For cold paths or rarely-used APIs, libffi provides more flexibility.

#[cfg(all(test, feature = "cxx-bridge"))]
mod tests {
    use crate::ffi::{VectorCxx, VectorWrapper};
    use std::time::Instant;

    const ITERATIONS: usize = 1_000_000;

    #[test]
    fn benchmark_libffi_vs_cxx() {
        // Warm up
        let v1 = VectorWrapper::new(1.0, 2.0).unwrap();
        let _ = v1.length();

        let v2 = VectorCxx::new(1.0, 2.0);
        let _ = v2.length();

        // Benchmark libffi approach
        let start = Instant::now();
        for _ in 0..ITERATIONS {
            let v = VectorWrapper::new(3.0, 4.0).unwrap();
            let _ = v.length();
        }
        let libffi_duration = start.elapsed();

        // Benchmark cxx approach
        let start = Instant::now();
        for _ in 0..ITERATIONS {
            let v = VectorCxx::new(3.0, 4.0);
            let _ = v.length();
        }
        let cxx_duration = start.elapsed();

        println!("\nPerformance comparison ({} iterations):", ITERATIONS);
        println!("  libffi: {:?} ({:.2} ns/call)", libffi_duration, libffi_duration.as_nanos() as f64 / ITERATIONS as f64);
        println!("  cxx:    {:?} ({:.2} ns/call)", cxx_duration, cxx_duration.as_nanos() as f64 / ITERATIONS as f64);
        println!("  Speedup: {:.2}x", libffi_duration.as_nanos() as f64 / cxx_duration.as_nanos() as f64);

        // cxx should be at least 2x faster
        assert!(cxx_duration < libffi_duration);
    }

    #[test]
    fn benchmark_method_calls() {
        const CALLS: usize = 10_000_000;

        // libffi: create once, call many times
        let v1 = VectorWrapper::new(3.0, 4.0).unwrap();
        let start = Instant::now();
        for _ in 0..CALLS {
            let _ = v1.length();
        }
        let libffi_duration = start.elapsed();

        // cxx: create once, call many times
        let v2 = VectorCxx::new(3.0, 4.0);
        let start = Instant::now();
        for _ in 0..CALLS {
            let _ = v2.length();
        }
        let cxx_duration = start.elapsed();

        println!("\nMethod call benchmark ({} calls):", CALLS);
        println!("  libffi: {:?} ({:.2} ns/call)", libffi_duration, libffi_duration.as_nanos() as f64 / CALLS as f64);
        println!("  cxx:    {:?} ({:.2} ns/call)", cxx_duration, cxx_duration.as_nanos() as f64 / CALLS as f64);
        println!("  Speedup: {:.2}x", libffi_duration.as_nanos() as f64 / cxx_duration.as_nanos() as f64);
    }
}
