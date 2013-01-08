t3d_include(${T3D_ENGINE_LIB_DIR}/libogg/include)

ADD_CUSTOM_COMMAND( TARGET LIBOGG_CONFIGURE COMMAND './configure' WORKING_DIRECTORY ${T3D_ENGINE_LIB_DIR}/libogg)

t3d_library(libogg ${T3D_ENGINE_LIB_DIR}/libogg/src)
   t3d_lib_folder("")
t3d_end_library()

t3d_add_lib(libogg)
