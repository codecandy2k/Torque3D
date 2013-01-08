t3d_include(${T3D_ENGINE_LIB_DIR}/lungif)
t3d_def_local(HAVE_FCNTL_H)

t3d_def_local(HAVE_IO_H)

t3d_library(lungif ${T3D_ENGINE_LIB_DIR}/lungif)
   t3d_lib_folder("")
t3d_end_library()

t3d_add_lib(lungif)
