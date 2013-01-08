t3d_include(${T3D_ENGINE_LIB_DIR}/opcode)
t3d_def(BAN_OPCODE_AUTOLINK)
t3d_def(ICE_NO_DLL)
t3d_def(TORQUE_OPCODE)

t3d_library(opcode ${T3D_ENGINE_LIB_DIR}/opcode)
   t3d_lib_folder("")
   t3d_lib_folder(Ice)
t3d_end_library()

t3d_add_lib(opcode)