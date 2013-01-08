t3d_include(${T3D_ENGINE_SRC_DIR})

t3d_src_folder(app)
t3d_src_folder(app/net)
t3d_src_folder(cinterface)
t3d_src_folder(collision)
t3d_src_folder(component)
t3d_src_folder(component/interfaces)
t3d_src_folder(console)
t3d_src_folder(core)
t3d_src_folder(core/ogg)
t3d_src_folder(core/stream)
t3d_src_folder(core/strings)
t3d_src_folder(core/util)
t3d_src_folder(core/util/journal)
t3d_src_folder(core/util/zip)
t3d_src_folder(core/util/zip/compressors)
t3d_src_folder(environment)
t3d_src_folder(forest)

if (T3D_USE_D3D9)
   t3d_src_folder(forest/hlsl)
endif(T3D_USE_D3D9)

if (T3D_USE_OPENGL)
   t3d_src_folder(forest/glsl)
endif(T3D_USE_OPENGL)

t3d_src_folder(forest/ts)

t3d_src_folder(gfx)
t3d_src_folder(gfx/bitmap)
t3d_src_folder(gfx/bitmap/loaders)

if (T3D_USE_D3D9)
   t3d_src_folder(gfx/D3D9)
   t3d_src_folder(gfx/D3D9/pc)
endif(T3D_USE_D3D9)

if (T3D_USE_OPENGL)
   t3d_src_folder(gfx/gl)
endif(T3D_USE_OPENGL)

t3d_src_folder(gfx/sim)
t3d_src_folder(gfx/util)
t3d_src_folder(gfx/video)

t3d_src_folder(gui)
t3d_src_folder(gui/3d)
t3d_src_folder(gui/buttons)
t3d_src_folder(gui/containers)
t3d_src_folder(gui/controls)
t3d_src_folder(gui/core)
t3d_src_folder(gui/game)
t3d_src_folder(gui/shiny)
t3d_src_folder(gui/theora)
t3d_src_folder(gui/utility)

t3d_src_folder(i18n)
t3d_src_folder(interior)

t3d_src_folder(lighting)
t3d_src_folder(lighting/common)

t3d_src_folder(materials)
t3d_src_folder(math)
t3d_src_folder(math/util)

t3d_src_folder(platform)
t3d_src_folder(platform/async)
t3d_src_folder(platform/menus)
t3d_src_folder(platform/nativeDialogs)
t3d_src_folder(platform/threads)

t3d_src_folder(platformWin32)
t3d_src_folder(platformWin32/menus)
t3d_src_folder(platformWin32/minidump)
t3d_src_folder(platformWin32/nativeDialogs)
t3d_src_folder(platformWin32/threads)
t3d_src_folder(platformWin32/videoInfo)

t3d_src_folder(postFx)

t3d_src_folder(renderInstance)
t3d_src_folder(scene)
t3d_src_folder(scene/culling)
t3d_src_folder(scene/mixin)
t3d_src_folder(scene/zones)

t3d_src_folder(sfx)
t3d_src_folder(sfx/media)
t3d_src_folder(sfx/dsound)
t3d_src_folder(sfx/xaudio)

t3d_src_folder(shaderGen)
t3d_src_folder(shaderGen/HLSL)

t3d_src_folder(sim)

t3d_src_folder(T3D)
t3d_src_folder(T3D/decal)
t3d_src_folder(T3D/examples)
t3d_src_folder(T3D/fps)
t3d_src_folder(T3D/fx)
t3d_src_folder(T3D/gameBase)
t3d_src_folder(T3D/gameBase/std)
t3d_src_folder(T3D/physics)
t3d_src_folder(T3D/sfx)
t3d_src_folder(T3D/turret)
t3d_src_folder(T3D/vehicles)

t3d_src_folder(terrain)
t3d_src_folder(terrain/hlsl)

t3d_src_folder(ts)
t3d_src_folder(ts/arch)
t3d_src_folder(ts/collada)
t3d_src_folder(ts/loader)

t3d_src_folder(unit)
t3d_src_folder(util)
t3d_src_folder(util/messaging)

t3d_src_folder(windowManager)

t3d_src_folder(windowManager/win32)
