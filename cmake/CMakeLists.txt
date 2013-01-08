if (T3D_USE_PHYSX)
   find_package(PhysX REQUIRED)
endif(T3D_USE_PHYSX)


include_directories(${T3D_ENGINE_LIB_DIR})

#source code for DLL
t3d_dll(${T3D_DLL_NAME} ${T3D_ENGINE_SRC_DIR})

#libraries
   t3d_module(libs/tinyxml)
   t3d_module(libs/zlib)
   t3d_module(libs/pcre)
   t3d_module(libs/libogg)
   t3d_module(libs/libtheora)
   t3d_module(libs/libvorbis)
   t3d_module(libs/ljpeg)
   t3d_module(libs/lmng)
   t3d_module(libs/lpng)
   t3d_module(libs/lungif)
   t3d_module(libs/collada)
   t3d_module(libs/convexDecomp)
   t3d_module(libs/opcode)
   t3d_module(libs/squish)

if (T3D_USE_PHYSX)
   t3d_module(libs/nxuStream)
   t3d_module(libs/nxCharacter)
endif(T3D_USE_PHYSX)

#engine sources
   t3d_module(engine/core)
   t3d_module(engine/basicLighting)
   t3d_module(engine/advancedLighting)
   t3d_module(engine/dsound)
   t3d_module(engine/tools)

if (T3D_USE_PHYSX)
   t3d_module(engine/physx)
endif(T3D_USE_PHYSX)

if (MSVC)
   t3d_add_lib(opengl32.lib)
   t3d_add_lib(winmm.lib)
   t3d_add_lib(ws2_32.lib)
   t3d_add_lib(d3d9.lib)
   t3d_add_lib(d3dx9.lib)
   t3d_add_lib(DxErr.lib)
endif(MSVC)

t3d_end_dll()