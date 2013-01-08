t3d_def(TORQUE_COLLADA)
t3d_def(DOM_INCLUDE_TINYXML)

t3d_include(${T3D_ENGINE_LIB_DIR}/collada/include)
t3d_include(${T3D_ENGINE_LIB_DIR}/collada/include/1.4)

t3d_library(libcollada ${T3D_ENGINE_LIB_DIR}/collada/src)
   t3d_lib_folder(1.4/dom)
   t3d_lib_folder(dae)
   t3d_lib_folder(modules/STLDatabase)
   t3d_lib_folder(modules/stdErrPlugin)
t3d_end_library()

t3d_add_lib(libcollada)
