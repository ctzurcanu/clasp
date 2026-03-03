#ifndef RLASP_H
#define RLASP_H

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct RlaspRuntime RlaspRuntime;

typedef int (*RlaspRustFn)(size_t argc, const uintptr_t *argv, uintptr_t *result_out);

RlaspRuntime *rlasp_init(void);
int rlasp_eval(RlaspRuntime *runtime, const char *expr, char **result_out);
int rlasp_eval_file(RlaspRuntime *runtime, const char *source_or_path, char **result_out);
int rlasp_compile(RlaspRuntime *runtime, const char *input_path, const char *output_path);
int rlasp_load_image(RlaspRuntime *runtime, const char *image_path);
int rlasp_register_rust_fn(RlaspRuntime *runtime, const char *name, RlaspRustFn fn);
int rlasp_load_rust_plugin(RlaspRuntime *runtime, const char *plugin_path);
void rlasp_free_string(char *s);
void rlasp_shutdown(RlaspRuntime *runtime);

#ifdef __cplusplus
}
#endif

#endif
