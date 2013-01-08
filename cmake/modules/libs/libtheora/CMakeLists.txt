t3d_def(TORQUE_OGGTHEORA)
t3d_include(${T3D_ENGINE_LIB_DIR}/libtheora/include)

t3d_library(libtheora ${T3D_ENGINE_LIB_DIR}/libtheora/lib)
   t3d_lib_folder("")
   t3d_lib_folder(dec)
   t3d_lib_folder(dec/x86)
   t3d_lib_folder(enc)
   t3d_lib_folder(enc/x86_32)
t3d_end_library()

t3d_add_lib(libtheora)
