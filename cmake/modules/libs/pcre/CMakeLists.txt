t3d_include(${T3D_ENGINE_LIB_DIR}/pcre)

t3d_def(PCRE_STATIC)
t3d_def_local(HAVE_CONFIG_H)

t3d_library(pcre ${T3D_ENGINE_LIB_DIR}/pcre)
   t3d_lib_folder("")
t3d_end_library()

t3d_add_lib(pcre)
