t3d_include("${PHYSX_INCLUDE_DIRS}")

t3d_def(TORQUE_PHYSICS_PHYSX)
t3d_def(TORQUE_PHYSICS_ENABLED)

t3d_src_folder(T3D/physics/physX)


t3d_add_lib("${PHYSX_LIBRARIES}")
