t3d_include("${PHYSX_INCLUDE_DIRS}")
t3d_def(NXCHARACTER_STATIC)

t3d_library(nxuStream ${PHYSX_NXUSTREAM_DIR})
   t3d_lib_folder("")
t3d_end_library()

t3d_add_lib(nxuStream)