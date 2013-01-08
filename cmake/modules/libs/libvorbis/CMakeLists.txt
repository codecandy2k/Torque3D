t3d_def(TORQUE_OGGVORBIS)

t3d_include(${T3D_ENGINE_LIB_DIR}/libvorbis/include)
t3d_include(${T3D_ENGINE_LIB_DIR}/libvorbis/lib)

t3d_library(libvorbis ${T3D_ENGINE_LIB_DIR}/libvorbis/lib)
   t3d_lib_folder("")
t3d_end_library()

t3d_add_lib(libvorbis)

