t3d_def(TORQUE_ADVANCED_LIGHTING)

t3d_src_folder(lighting/advanced)
t3d_src_folder(lighting/shadowMap)

if (T3D_USE_D3D9)
   t3d_src_folder(lighting/advanced/hlsl)
endif(T3D_USE_D3D9)

if (D3D_USE_OPENGL)
   t3d_src_folder(lighting/advanced/glsl)
endif(D3D_USE_OPENGL)
