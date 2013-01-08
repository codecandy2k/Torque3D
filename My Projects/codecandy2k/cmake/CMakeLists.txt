cmake_minimum_required (VERSION 2.8)

set(T3D_PROJECT_NAME codecandy2k)
set(T3D_DX9_DIR "d:/dxsdk")


project(${T3D_PROJECT_NAME})

#so we can have Visual Studio solution folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)



set(T3D_USE_D3D9 TRUE)
set(T3D_USE_OPENGL FALSE)
set(T3D_USE_PHYSX FALSE)

set(T3D_PROJECT_DIR ${PROJECT_SOURCE_DIR}/..)

set(T3D_VERSION_MAJOR 1)
set(T3D_VERSION_MINOR 2)


if (T3D_USE_D3D9)
   include_directories(${T3D_DX9_DIR}/include)
   link_directories(${T3D_DX9_DIR}/lib/x86)
endif(T3D_USE_D3D9)

add_subdirectory(${T3D_PROJECT_DIR}/../../cmake/app "${CMAKE_CURRENT_BINARY_DIR}/${T3D_PROJECT_NAME}/app")
