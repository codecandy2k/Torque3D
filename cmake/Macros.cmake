#begin defining a library
macro(t3d_library library_name folder_base)
   set(T3D_LIB_SRC_ALL "")
   set(T3D_FOLDER_BASE ${folder_base})
   set(T3D_LIBRARY_NAME ${library_name})
endmacro(t3d_library)

#finish and commit the creation of the library
macro(t3d_end_library)
   add_library(${T3D_LIBRARY_NAME} ${T3D_LIB_SRC_ALL})
   list(APPEND T3D_TARGET_LIBS ${T3D_LIBRARY_NAME})
   set(T3D_TARGET_LIBS "${T3D_TARGET_LIBS}" PARENT_SCOPE)
   SET_PROPERTY(TARGET ${T3D_LIBRARY_NAME} PROPERTY FOLDER "libs")
endmacro(t3d_end_library)

#begin defining the main engine DLL
macro(t3d_dll library_name folder_base)
   set(T3D_DLL_SRC_ALL "")
   set(T3D_TARGET_LIBS "")
   set(T3D_FOLDER_BASE ${folder_base})
   set(T3D_LIBRARY_NAME ${library_name})
endmacro(t3d_dll)

#finish and commit the creation of the main engine DLL. Copies the output DLL to the staging directory.
macro(t3d_end_dll)
   foreach(folder in ${T3D_FOLDERS})
      t3d_src_add_folder("${folder}")
   endforeach()

   add_library(${T3D_LIBRARY_NAME} SHARED ${T3D_SRC_ALL} ${T3D_ENGINE_LIB_DIR}/Torque3D/msvc/torque3d.def)

   get_property(T3D_DLL_LOCATION TARGET ${T3D_LIBRARY_NAME} PROPERTY LOCATION)

   target_link_libraries(${T3D_LIBRARY_NAME} ${T3D_TARGET_LIBS} )

   add_custom_command(
      TARGET ${T3D_LIBRARY_NAME}
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy "${T3D_DLL_LOCATION}" "${T3D_STAGE_DIR}/${T3D_PROJECT_NAME}.dll" )

endmacro(t3d_end_dll)


#adds all .h, .c, .cpp and .cc files to the currently active library definition
macro(t3d_lib_folder folder_name)
   file(GLOB SRC_FOLDER "${T3D_FOLDER_BASE}/${folder_name}/*.h" "${T3D_FOLDER_BASE}/${folder_name}/*.cpp" "${T3D_FOLDER_BASE}/${folder_name}/*.c" "${T3D_FOLDER_BASE}/${folder_name}/*.cc")
   list(APPEND T3D_LIB_SRC_ALL ${SRC_FOLDER})

   file(TO_NATIVE_PATH "src/${folder_name}" SRC_GROUP)
   source_group(${SRC_GROUP} FILES ${SRC_FOLDER})
endmacro(t3d_lib_folder)

#adds all .h, .c, .cpp and .cc files to the currently active engine module
macro(t3d_src_folder folder_name)
   list(APPEND T3D_FOLDERS ${folder_name})
   set(T3D_FOLDERS "${T3D_FOLDERS}" PARENT_SCOPE)
endmacro(t3d_src_folder)

macro(t3d_src_add_folder folder_name)
   file(GLOB SRC_FOLDER "${T3D_FOLDER_BASE}/${folder_name}/*.h" "${T3D_FOLDER_BASE}/${folder_name}/*.cpp" "${T3D_FOLDER_BASE}/${folder_name}/*.c" "${T3D_FOLDER_BASE}/${folder_name}/*.cc")
   file(TO_NATIVE_PATH "Source Files/${folder_name}" SRC_GROUP)
   SOURCE_GROUP(${SRC_GROUP} FILES ${SRC_FOLDER})

   list(APPEND T3D_SRC_ALL ${SRC_FOLDER})
   set(T3D_SRC_ALL "${T3D_SRC_ALL}" PARENT_SCOPE)
endmacro(t3d_src_add_folder)

#adds a library dependency to the currently active target
macro(t3d_add_lib lib_name)
   list(APPEND T3D_TARGET_LIBS ${lib_name})
   set(T3D_TARGET_LIBS "${T3D_TARGET_LIBS}" PARENT_SCOPE)
endmacro(t3d_add_lib)

#loads a module from the specified directory
macro(t3d_module module_name)
  add_subdirectory(${T3D_MODULES_DIR}/${module_name})
  include_directories(${T3D_INCLUDES})
  add_definitions(${T3D_DEFINITIONS})

  set(T3D_INCLUDES "${T3D_INCLUDES}" PARENT_SCOPE)
  set(T3D_DEFINITIONS "${T3D_DEFINITIONS}" PARENT_SCOPE)
  set(T3D_DEFINITIONS_DEBUG "${T3D_DEFINITIONS_DEBUG}" PARENT_SCOPE)
endmacro(t3d_module)

#used for setting include directoires that are propagated up to the parent directory
macro(t3d_include dir)
   foreach(incdir ${dir})
      list(APPEND T3D_INCLUDES ${incdir})
   endforeach()

   set(T3D_INCLUDES "${T3D_INCLUDES}" PARENT_SCOPE)
   include_directories(${dir})
endmacro(t3d_include)

#used for setting include directories that are only used by the module and not propagated up to the parent
macro(t3d_include_local dir)
   include_definitions(${dir})
endmacro(t3d_include_local)

#sets preprocessor definitions that are propagated up to the parent directory
macro(t3d_def def_val)
   add_definitions(-D${def_val})
   list(APPEND T3D_DEFINITIONS "-D${def_val}")
   set(T3D_DEFINITIONS "${T3D_DEFINITIONS}" PARENT_SCOPE)
endmacro(t3d_def)

macro(t3d_def_local def_val)
   add_definitions(-D${def_val})
endmacro(t3d_def_local)

macro(t3d_def_debug def_val)
   list(APPEND T3D_DEFINITIONS_DEBUG "${def_val}")
   set(T3D_DEFINITIONS_DEBUG "${T3D_DEFINITIONS_DEBUG}" PARENT_SCOPE)
   t3d_add_debug_defs("${T3D_DEFINITIONS_DEBUG}")
endmacro(t3d_def_debug)

macro(t3d_def_release def_val)
   list(APPEND T3D_DEFINITIONS_RELEASE "${def_val}")
   set(T3D_DEFINITIONS_RELEASE "${T3D_DEFINITIONS_RELEASE}" PARENT_SCOPE)
   t3d_add_release_defs("${T3D_DEFINITIONS_RELEASE}")
endmacro(t3d_def_release)

macro(t3d_add_debug_defs defs)
   foreach(def ${defs})
      if(MSVC)
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /D${def}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /D${def}")
	  endif()
   endforeach()
endmacro(t3d_add_debug_defs)

macro(t3d_add_release_defs defs)
   foreach(def ${defs})
      if(MSVC)
        set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /D${def}")
        set(CMAKE_C_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /D${def}")
	  endif()
   endforeach()
endmacro(t3d_add_release_defs)
