project(${T3D_PROJECT_NAME})

set(T3D_DIR ${T3D_PROJECT_DIR}/../..)
set(T3D_STAGE_DIR ${T3D_PROJECT_DIR}/game)
Set(T3D_DLL_NAME "${T3D_PROJECT_NAME}_DLL")
set(T3D_ENGINE_DIR "${T3D_DIR}/Engine")
set(T3D_ENGINE_LIB_DIR "${T3D_ENGINE_DIR}/lib")
set(T3D_ENGINE_SRC_DIR "${T3D_ENGINE_DIR}/source")
set(T3D_CMAKE_DIR "${T3D_DIR}/cmake")
set(T3D_MODULES_DIR "${T3D_DIR}/cmake/modules")


include("${T3D_CMAKE_DIR}/Macros.cmake")

include_directories("${T3D_PROJECT_DIR}/config")

if (MSVC)
   set(CMAKE_CXX_FLAGS_DEBUG "/MTd /Zi /Od ")
   set(CMAKE_CXX_FLAGS_RELEASE "/MT")
   set(CMAKE_C_FLAGS_DEBUG "/MTd /Zi /Od")
   set(CMAKE_C_FLAGS_RELEASE "/MT")
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /Zc:wchar_t-")
endif()



t3d_def_debug(TORQUE_DEBUG)
t3d_def_debug(TORQUE_DEBUG_GUARD)


if (MSVC)
   t3d_def(_WINDOWS)
   t3d_def(UNICODE)
   t3d_def(_CRT_SECURE_NO_DEPRECATE)
   t3d_def(_CRT_SECURE_NO_WARNINGS)
   t3d_def(INITGUID)
   t3d_def_debug(_DEBUG)
   t3d_def_release(DEBUG)
   t3d_def_debug(D3D_DEBUG_INFO)
endif(MSVC)

t3d_def(TORQUE_SHARED)
t3d_def(TORQUE_UNICODE)
t3d_def(TORQUE_SHADERGEN)
t3d_def(LTC_NO_PROTOTYPES)
t3d_def(TORQUE_COLLADA)
t3d_def(TORQUE_NET_STATS)


#so CMake can find the FindPhysX module
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${T3D_MODULES_DIR}/cmake")


####################################################################
#create the DLL
####################################################################

add_subdirectory(${T3D_DIR}/cmake "${CMAKE_CURRENT_BINARY_DIR}/T3D")
####################################################################
#create the EXE
####################################################################

include_directories("${T3D_INCLUDES}")

FOREACH(def ${T3D_DEFINITIONS})
   add_definitions(${def})
ENDFOREACH()

t3d_add_debug_defs("${T3D_DEFINITIONS_DEBUG}")
t3d_add_release_defs("${T3D_DEFINITIONS_RELEASE}")

set(T3D_APP_MAIN ${T3D_ENGINE_SRC_DIR}/main/main.cpp)

add_executable(${T3D_PROJECT_NAME} WIN32 ${T3D_APP_MAIN} ${T3D_APP_EXTRA_SOURCES})

set_target_properties(${T3D_PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${T3D_STAGE_DIR}")
set_target_properties(${T3D_PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG "${T3D_STAGE_DIR}")
set_target_properties(${T3D_PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE "${T3D_STAGE_DIR}")

target_link_libraries( ${T3D_PROJECT_NAME} ${T3D_DLL_NAME} )