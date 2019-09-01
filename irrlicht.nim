## compile with:
##
##    $ nim cpp myirrlichtex.nim
##
## make sure that irrlicht.dll available in your system path
{.link: r"d:\Installer\irrlicht\lib\Win64-visualStudio\Irrlicht.lib".}

#[
{.emit: """/*TYPESECTION*/
typedef NI16 wchar_t;
""".}
]#

#[
{.emit: """
using namespace irr;
using namespace core;
using namespace scene;
using namespace video;
using namespace io;
using namespace gui;
""".}
]#

const
  irr = "<irrlicht.h>"
  irrPath* = "d:\\Installer\\irrlicht\\media"

template makeIrrId(c0, c1, c2, c3: typed): untyped =
  (c0 or c1 shl 8 or c2 shl 16 or c3 shl 24)

type
  #[
  u32* {. header: irr, importcpp: "irr::core::u32" .} = object
  s32* {. header: irr, importcpp: "irr::core::u32" .} = object
  f32* {. header: irr, importcpp: "irr::core::u32" .} = object
  ]#
  wchar_t* {.header: "<wchar.h>", importc.} = object
  Line3d* {.header: irr, importcpp:"irr::core::line3d<irr::f32>" .} = object
    start, `end`: Vector3df
  Rect* {.final header: irr,
    importcpp: "irr::core::rect<irr::s32>" .} = object
  Triangle3df* {. header: irr,
    importcpp: "irr::core::triangle3d<irr::f32>" .} = object
  AabBox3df* {.final header: irr,
    importcpp: "irr::core::aabbox3df" .} = object
  Dimension2d* {.final header: irr,
    importcpp: "irr::core::dimension2d".} [T]= object
  Vector2df* {.final header: irr,
    importc: "irr::core::vector2df".} = object
  Vector3df* {.final header: irr,
    importc: "irr::core::vector3df".} = object
  Position2d*{.final header: irr,
    importcpp: "irr::core::position2d<irr::s32>".} = object
  Matrix4* {.final header: irr, importc: "irr::core::matrix4" .} = object
  TColor* {.final header: irr, importc: "irr::video::SColor" .} = object
  ITimer* {.header: irr, importcpp: "irr::ITimer" .} = object
  IrrlichtDevice* {.final header: irr,
    importc: "irr::IrrlichtDevice".} = object
  IVideoDriver* {.final header: irr,
    importcpp: "irr::video::IVideoDriver" .} = object
  ISceneManager* {. header: irr,
    importcpp: "irr::scene::ISceneManager".} = object
  ISceneNode* {. header: irr,
    importcpp: "irr::scene::ISceneNode".} = object
  IGUIEnvironment* {.final header: irr,
      importcpp: "irr::gui::IGUIEnvironment".} = object
  IGUIFont* {.final header: irr,
    importcpp: "irr::gui::IGUIFont".} = object
  IAnimatedMesh* {.final header: irr,
    importcpp: "irr::scene::IAnimatedMesh".} = object
  IAnimatedMeshSceneNode* {.final header: irr,
      importcpp: "irr::scene::IAnimatedMeshSceneNode".} = object
  IMesh* {. final header: irr,
    importcpp: "irr::scene::IMesh" .} = object
  IMeshSceneNode* {.final header: irr,
    importcpp: "irr::scene::IMeshSceneNode" .} = object
  Texture* {.final header: irr,
    importcpp: "irr::video::ITexture" .} = object
  FileSystem* {.final header: irr,
    importcpp: "irr::io::IFileSystem" .} = object
  FileArchive* {.final header: irr
    importcpp: "irr::io::IFileArchive" .} = object
  ICursorControl* {.final header: irr,
    importcpp: "irr::gui::ICursorControl" .} = object
  IEventReceiver* {.header: irr,
    importcpp: "irr::IEventReceiver" .} = object
  KeyMap* {.final header: irr, importcpp: "irr::SKeyMap" .} = object
  CameraSceneNode* {.final header:irr,
    importcpp: "irr::scene::ICameraSceneNode" .} = object
  SMaterial* {. header: irr, importcpp: "irr::video::SMaterial" .} = object
    lighting: bool
    normalizeNormals: bool
    texture: PTexture
    wireframe: bool
  S3DVertex* {.final header: irr,
    importcpp: "irr::video::S3DVertex" .} = object
  ISceneNodeAnimator* {.final header: irr,
    importcpp: "irr::scene::ISceneNodeAnimator" .} = object
  ITriangleSelector* {. header: irr,
    importcpp: "irr::scene::ITriangleSelector" .} = object
  ISceneNodeAnimatorCollisionResponse* {. header: irr,
    importcpp: "irr::scene::ISceneNodeAnimatorCollisionResponse" .} = object
  IBillboardSceneNode* {. header:irr,
    importcpp: "irr::scene::IBillboardSceneNode" .} = object
  ILightSceneNode* {. header: irr,
    importcpp: "irr::scene::ILightSceneNode".} = object
  ISceneCollisionManager* {. header: irr,
    importcpp: "irr::scene::ISceneCollisionManager" .} = object
  IMeshManipulator* {. header: irr,
    importcpp: "irr::scene::IMeshManipulator" .} = object
  IParticleSystemSceneNode* {. header: irr,
    importcpp: "irr::scene::IParticleSystemSceneNode" .} = object
  IParticleBoxEmitter* {. header: irr,
    importcpp: "irr::scene::IParticleBoxEmitter" .} = object
  IParticleAffector* {. header: irr,
    importcpp: "irr::scene::IParticleAffector" .} = object
  IParticleFadeOutAffector* {. header: irr,
    importcpp: "irr::scene::IParticleFadeOutAffector" .} = object
  IVolumeLightSceneNode* {. header: irr,
    importcpp: "irr::scene::IVolumeLightSceneNode" .} = object
  Array* {. header: irr, importcpp: "irr::core::array" .} [T] = object
  IShadowVolumeSceneNode* {. header: irr,
    importcpp: "irr::scene::IShadowVolumeSceneNode" .} = object

  PIrrlichtDevice* = ptr IrrlichtDevice
  PIVideoDriver* = ptr IVideoDriver
  PISceneManager* = ptr ISceneManager
  PISceneNode* = ptr ISceneNode
  PIAnimatedMesh* = ptr IAnimatedMesh
  PIAnimatedMeshSceneNode* = ptr IAnimatedMeshSceneNode
  PIMesh* = ptr IMesh
  PIMeshSceneNode* = ptr IMeshSceneNode
  PIGUIEnvironment* = ptr IGUIEnvironment
  PIGUIFont* = ptr IGUIFont
  PTexture* = ptr Texture
  PFileSystem* = ptr FileSystem
  PFileArchive* = ptr FileArchive
  PICursorControl* = ptr ICursorControl
  PKeyMap* = ptr KeyMap
  PCameraSceneNode* = ptr CameraSceneNode
  PSMaterial* = ptr SMaterial
  PISceneNodeAnimator* = ptr ISceneNodeAnimator
  PITimer* = ptr ITimer
  PIEventReceiver* = ptr IEventReceiver
  PITriangleSelector* = ptr ITriangleSelector
  PISceneNodeAnimatorCollisionResponse* = ptr ISceneNodeAnimatorCollisionResponse
  PIBillboardSceneNode* = ptr IBillboardSceneNode
  PILightSceneNode* = ptr ILightSceneNode
  PISceneCollisionManager* = ptr ISceneCollisionManager
  PIMeshManipulator* = ptr IMeshManipulator
  PIParticleSystemSceneNode* = ptr IParticleSystemSceneNode
  PIParticleBoxEmitter* = ptr IParticleBoxEmitter
  PIParticleAffector* = ptr IParticleAffector
  PIParticleFadeOutAffector* = ptr IParticleFadeOutAffector
  PIVolumeLightSceneNode* = ptr IVolumeLightSceneNode
  PIShadowVolumeSceneNode* = ptr IShadowVolumeSceneNode

  DriverType* {.final header: irr,
      importc: "irr::video::E_DRIVER_TYPE".} = enum
    dtEDT_NULL dtEDT_SOFTWARE dtEDT_BURNINGSVIDEO dtEDT_DIRECT3D8
    dtEDT_DIRECT3D9 dtEDT_OPENGL dtEDT_COUNT
    
  FileArchiveType* {.final header: irr,
    importc: "irr::io::E_FILE_ARCHIVE_TYPE" .} = enum
      fat_WAD       = makeIrrId(ord 'W', ord 'A', ord 'D', 0)
      fat_PAK       = makeIrrId(ord 'P', ord 'A', ord 'K', 0)
      fat_NPK       = makeIrrId(ord 'N', ord 'P', ord 'K', 0)
      fat_ZIP       = makeIrrId(ord 'Z', ord 'I', ord 'P', 0)
      fat_TAR       = makeIrrId(ord 'T', ord 'A', ord 'R', 0)
      fat_UNKNOWN   = makeIrrId(ord 'u', ord 'n', ord 'k', ord 'n')
      fat_GZIP      = makeIrrId(ord 'g', ord 'z', ord 'i', ord 'p')
      fat_FOLDER    = makeIrrId(ord 'f', ord 'l', ord 'd', ord 'r')


  MaterialFlag* {.final header: irr,
      importc: "irr::video::E_MATERIAL_FLAG".} = enum
    EMF_WIREFRAME = 0x1, EMF_POINTCLOUD = 0x2, EMF_GOURAUD_SHADING = 0x4
    EMF_LIGHTING = 0x8, EMF_ZBUFFER = 0x10, EMF_ZWRITE_ENABLE = 0x20,
    EMF_BACK_FACE_CULLING = 0x40, EMF_FRONT_FACE_CULLING = 0x80,
    EMF_BILINEAR_FILTER = 0x100, EMF_TRILINEAR_FILTER = 0x200
    EMF_ANISOTROPIC_FILTER = 0x400, EMF_FOG_ENABLE = 0x800
    EMF_NORMALIZE_NORMALS = 0x1000, EMF_TEXTURE_WRAP = 0x2000
    EMF_ANTI_ALIASING = 0x4000, EMF_COLOR_MASK = 0x8000
    EMF_COLOR_MATERIAL = 0x10000, EMF_USE_MIP_MAPS = 0x20000
    EMF_BLEND_OPERATION = 0x40000, EMF_POLYGON_OFFSET = 0x80000

  TransformationState* {.final header: irr,
    importc: "irr::video::E_TRANSFORMATION_STATE" .} = enum 
      tsView tsWorld tsProjection tsTexture0 tsTexture1 tsTexture2
      tsTexture3 tsCount

  MD2AnimationType* {.final header: irr,
    importc: "irr::scene::EMD2_ANIMATION_TYPE" .} = enum
      md2Stand md2Run md2Attack md2PainA md2PainB md2PainC
      md2Jump md2Flip md2Salute md2Fallback md2Wave md2Point
      md2CrouchStand md2CrouchWalk md2CrouchAttack md2CrouchPain
      md2CrouchDeath md2DeathFallback md2DeathFallforward
      md2DeathFallbackSlow md2Boom md2Count

  MD3AnimationType* {.final header: irr,
    importc: "irr::scene::EMD3_ANIMATION_TYPE" .} = enum
      md3BothDeath1 md3BothDead1
      md3BothDeath2 md3BothDead2
      md3BothDeath3 md3BothDead3
      md3TorsoGesture md3TorsoAttack1 md3TorsoAttack2
      md3TorsoDrop md3TorsoRaise
      md3TorsoStand1 md3TorsoStand2
      md3LegsWalkCrouch md3LegsWalk md3LegsRun
      md3LegsBack md3LegsSwim md3LegsJump1 md3LegsLand1
      md3LegsJump2 md3LegsLand2 md3LegsIdle md3LegsIdleCrouch
      md3LegsTurn md3AnimationCount

  MaterialType* {. header: irr,
    importc: "irr::video::E_MATERIAL_TYPE" .} = enum
      mtSolid mtSolid2Layer mtLightMap mtLightMapAdd mtLightMapM2
      mtLightMapM4 mtLightMapLighting mtLightMapLightingM2
      mtLigthMapM4 mtDetailMap mtSphereMap mtReflection2Layer
      mtTransparentAddColor mtTransparentAlphaChannel
      mtTransparentAlphaChannelRef mtTransparentVertexAlpha
      mtTransparentReflection2Layer mtNormalMapSolid
      mtNormalMapTransparentAddColor mtNormalMapTransparentVertexAlpha
      mtParallaxMapSolid mtParallaxMapTransparentAddColor
      mtParallaxMapTransparentVertexAlpha mtOneTextureBlend
      mtForce32Bit


template toWChar* (x: untyped): untyped = cast[ptr wchar_t](x)

proc aabbox3df*(): AabBox3df {. header: irr,
  importc: "irr::core::aabbox3df" .}
proc aabbox3df*(a, b, c, x, y, z: cfloat): AabBox3df {. header: irr,
  importc: "irr::core::aabbox3d<irr::f32>" .}
proc position2d*(x, y: cint): Position2d {. header: irr,
  importc: "irr::core::position2d<irr::s32>".}
proc dimension2du*(x, y: cint): Dimension2d[cuint] {.
  header: irr, importc: "irr::core::dimension2d<irr::u32>" .}
proc dimension2df*(x, y: cfloat): Dimension2d[cfloat] {.
  header: irr, importc: "irr::core::dimension2d<irr::f32>" .}
proc vector2df*[T: cint or float](x, y: T): Vector2df {.
  header: irr, importc: "irr::core::vector2df" .}
proc vector3df*[T: cint or float64](x, y, z: T): Vector3df {.
  header: irr, importc: "irr::core::vector3df" .}
proc rect*(x1, y1, x2, y2: cint): Rect {.
  header: irr, importc: "irr::core::rect<irr::s32>" .}
proc push_back*[T](arr: Array[T], x: T)
  {. header: irr, importcpp: "push_back" .}
proc SColor*[T: cint or int or float](r,g,b,a: T): TColor {.
  header: irr, importc: "irr::video::SColor" .}

proc normalize*(vect: Vector3df): Vector3df {. header: irr,
  importcpp: "normalize" .}
proc `-`*(a, b: Vector3df): Vector3df {. header: irr,
  importcpp: "# - #" .}
proc `*`*[T: int or cint or float](a: Vector3df, b: T): Vector3df
  {. header: irr, importcpp: "# * #" .}
proc `+`*(a, b: Vector3df): Vector3df {. header: irr,
  importcpp: "# + #" .}

proc reset*(box: AabBox3df, pos: Vector3df) {.
  header: irr, importc: "reset" .}
proc addInternalPoint*(box: AabBox3df, pos: Vector3df) {.
  header: irr, importc: "addInternalPoint" .}

proc s3dVertex*(pos1, normal: Vector3df, color: TColor,
  coord: Vector2df): S3DVertex {.
  header: irr, importc: "irr::video::S3DVertex" .}
proc s3dVertex*(x, y, z, nx, ny, nz: float32, color: TColor,
  tu, tv: float32): S3DVertex {. header: irr, importc: "irr::video::S3DVertex" .}

proc triangle3df*(v1 = vector3df(0, 0, 0), v2 = vector3df(0, 0, 0),
  v3 = vector3df(0, 0, 0)): Triangle3df {. header: irr,
  importc: "irr::core::triangle3d<irr::f32>" .}

proc matrix4*(): Matrix4 {.header: irr, importc: "irr::core::matrix4".}

proc createDevice*(devType: DriverType, winSize = dimension2du(640, 480),
  bits: cint = 16, fullscreen = false, stencilBuffer = false, vsync = false,
  eventReceiver: PIEventReceiver = nil): PIrrlichtDevice {.
    header: irr, importc: "irr::createDevice" .}

proc createDevice*(): PIrrlichtDevice {.
    header: irr, importc: "irr::createDevice" .}

#proc setWindowCaption*(device: PIrrlichtDevice, caption: cstring) {.
proc setWindowCaption*(device: PIrrlichtDevice, caption: ptr wchar_t) {.
  header: irr, importcpp: "setWindowCaption" .}
proc getVideoDriver*(device: PIrrlichtDevice): PIVideoDriver {.
  header: irr, importcpp: "getVideoDriver" .}
proc getSceneManager*(device: PIrrlichtDevice): PISceneManager {.
  header: irr, importcpp: "getSceneManager" .}
proc getGUIEnvironment*(device: PIrrlichtDevice): PIGUIEnvironment {.
  header: irr, importcpp: "getGUIEnvironment" .}
proc run*(device: PIrrlichtDevice): bool {.
  header: irr, importcpp: "run" .}
proc drop*[T: PIrrlichtDevice or PISceneNodeAnimator or PISceneNode or
  PITriangleSelector or PISceneNodeAnimatorCollisionResponse or
  PIParticleBoxEmitter or PIParticleAffector or
  PIParticleFadeOutAffector] (device: T)
  {. header: irr, importcpp: "drop" .}
proc getCursorControl*(device: PIrrlichtDevice): PICursorControl {.
  header: irr, importcpp: "getCursorControl" .}

proc getTexture*(device: PIVideoDriver, where: cstring): PTexture {.
  header: irr, importcpp: "getTexture" .}
proc getFPS*(device: PIVideoDriver): cint {.
  header: irr, importcpp: "getFPS" .}
proc getName*(device: PIVideoDriver): ptr wchar_t =
  {.emit: [result, " = const_cast<wchar_t *>(", device,
    "->getName());"]
  .}

proc getFileSystem*(device: PIrrlichtDevice): PFileSystem {.
  header: irr, importcpp: "getFileSystem" .}
proc isWindowActive*(device: PIrrlichtDevice): bool {. header: irr,
  importcpp: "isWindowActive" .}
proc getTimer*(device: PIrrlichtDevice): PITimer {. header: irr,
  importcpp: "getTimer" .}
proc setEventReceiver*(device: PIrrlichtDevice, evt: PIEventReceiver) {.
  header: irr, importcpp: "setEventReceiver" .}

proc getMesh*(smgr: PISceneManager, where:cstring): PIAnimatedMesh {.
  header: irr, importcpp: "getMesh" .}

proc getMesh*(mesh: PIAnimatedMesh, frame: cint, detailLevel: cint = 255,
  startFrameLoop: cint = -1, endFrameLoop: cint = -1): PIMesh {.
    header: irr, importcpp: "getMesh" .}

proc addOctreeSceneNode*(smgr: PISceneManager, mesh: PIMesh,
  parent: PISceneNode = nil, id: cint = -1,
  minimalPolysPerNode: cint = 256,
  addMeshIfPtrZero = false): PIMeshSceneNode {.
    header: irr, importcpp: "addOctreeSceneNode" .}

proc addAnimatedMeshSceneNode*(smgr: PISceneManager,
  mesh: PIAnimatedMesh): PIAnimatedMeshSceneNode {.
    header: irr, importcpp: "addAnimatedMeshSceneNode" .}

proc addCameraSceneNode*(smgr: PISceneManager,
  pos:cint, vec1, vec2: Vector3df) {.
    header: irr, importcpp: "addCameraSceneNode" .}

proc addCameraSceneNodeFPS*(mgr: PISceneManager, scene: PISceneNode = nil,
  rotateSpeed = 100'f32, moveSpeed = 0.5'f32, id = -1,
  keyMapArray: PKeyMap = nil, noVerticalMovement = false,
  jumpSpeed = 0'f32, invertMouse = false,
  makeActive = false): PCameraSceneNode {. header: irr,
    importcpp: "addCameraSceneNodeFPS" .}

proc drawAll*(smgr: PISceneManager) {.
  header: irr, importcpp: "drawAll" .}

proc createRotationAnimator*(mgr: PISceneManager,
  rotationSpeed: Vector3df): PISceneNodeAnimator {. header: irr,
  importcpp: "createRotationAnimator" .}
proc getRootSceneNode*(mgr: PISceneManager): PISceneNode {.
  header: irr, importcpp: "getRootSceneNode" .}

proc addSphereSceneNode*(mgr: PISceneManager, radius = 5.0'f32,
  polyCount: cint = 16, parent: PISceneNode = nil, id = -1,
  position = vector3df(0.0, 0.0, 0.0),
  rotation = vector3df(0.0, 0.0, 0.0),
  #scale = vector3df(1.0, 1.0, 1.0)): PIMeshSceneNode {.
  scale = vector3df(1.0, 1.0, 1.0)): PISceneNode {.
  header: irr, importcpp: "addSphereSceneNode" .}

proc addCubeSceneNode*(mgr: PISceneManager, size = 10.0'f32,
  parent: PISceneNode = nil, id: int32 = (-1),
  position = vector3df(0.0, 0.0, 0.0),
  rotation = vector3df(0.0, 0.0, 0.0),
  scale = vector3df(1.0, 1.0, 1.0)): PISceneNode {.
  header: irr, importcpp: "addCubeSceneNode" .}

proc createFlyCircleAnimator*(mgr: PISceneManager,
  center = vector3df(0.0, 0.0, 0.0), radius = 100'f32, speed = 0.001'f32,
  direction = vector3df(0.0, 1.0, 0.0), startPosition = 0.0'f32,
  radiusEllipsoid = 0.0'f32): PISceneNodeAnimator {.
  header: irr, importcpp: "createFlyCircleAnimator" .}

proc createFlyStraightAnimator*(mgr: PISceneManager,
  startPoint, endPoint: Vector3df, timeForWay: uint32, loop = false,
  pingpong = false): PISceneNodeAnimator {.
  header: irr, importcpp: "createFlyStraightAnimator" .}

proc createOctreeTriangleSelector*[T: PIMesh or PIAnimatedMeshSceneNode or PIMeshSceneNode](mgr: PISceneManager, mesh: T, node: PIMeshSceneNode,
  minPolysPerNode: cint = 32): PITriangleSelector {. header: irr,
  importcpp: "createOctreeTriangleSelector" .}
proc createCollisionResponseAnimator*[T: PISceneNode or PIAnimatedMeshSceneNode or PCameraSceneNode](mgr: PISceneManager,
  world: PITriangleSelector, node: T, ellipsoidRadius = vector3df(30,60,30),
  gravityPerSecond = vector3df(0, -10, 0),
  ellipsoidTranslation = vector3df(0, 0, 0),
  slidingValue = 0.0005'f32): PISceneNodeAnimatorCollisionResponse {.
  header: irr, importcpp: "createCollisionResponseAnimator" .}

proc addBillboardSceneNode*(mgr: PISceneManager,
  parent: PISceneNode = nil,
  size = dimension2du(10, 10)): PIBillboardSceneNode {.
  header: irr, importcpp: "addBillboardSceneNode" .}

proc createTriangleSelector*(mgr: PISceneManager,
  an: PIAnimatedMeshSceneNode): PITriangleSelector {. header: irr,
  importcpp: "createTriangleSelector" .}

proc addLightSceneNode*(mgr: PISceneManager, parent: PISceneNode = nil,
  position = vector3df(0, 0, 0), color = SColor(1, 1, 1, 1),
  radius = 100.0, id = -1): PILightSceneNode {. header: irr,
  importcpp: "addLightSceneNode" .}

proc getSceneCollisionManager*(mgr: PISceneManager): PISceneCollisionManager {.
  header: irr, importcpp: "getSceneCollisionManager" .}

proc getMeshManipulator*(mgr: PISceneManager): PIMeshManipulator {.
  header: irr, importcpp: "getMeshManipulator" .}

proc addHillPlaneMesh*[S: string or cstring or
  WideCString](mgr: PISceneManager, path: S,
  tilesz: Dimension2d[cfloat], tilecnt: Dimension2d[cuint],
  material: PSMaterial = nil, hillHeight = 0.0,
  countHills = dimension2du(0, 0),
  textureRepeatCount = dimension2du(1, 1)): PIAnimatedMesh {.
  header: irr, importcpp: "addHillPlaneMesh" .}

proc addWaterSurfaceSceneNode* (mgr: PISceneManager, mesh: PIMesh,
  waveHeight: cfloat = 2, waveSpeed: cfloat = 300, waveLength: cfloat = 10,
  parent: PISceneNode = nil, id: cint = -1, position = vector3df(0, 0, 0),
  rotation = vector3df(0, 0, 0), scale = vector3df(1, 1, 1)): PISceneNode
  {. header: irr, importcpp: "addWaterSurfaceSceneNode" .}

proc addParticleSystemSceneNode*(mgr: PISceneManager,
  withDefaultEmitter = false, parent: PISceneNode = nil,
  id: cint = -1, position = vector3df(0, 0, 0),
  rotation = vector3df(0, 0, 0),
  scale = vector3df(1, 1, 1)): PIParticleSystemSceneNode {.
  header: irr, importcpp: "addParticleSystemSceneNode" .}

proc addVolumeLightSceneNode*(mgr: PISceneManager,
  parent: PISceneNode = nil, id: cint = -1, subdivU: cuint = 32,
  subdivV: cuint = 32,
  foot = SColor(51, 0, 230, 180), tail = SColor(0, 0, 0, 0),
  position = vector3df(0, 0, 0), rotation = vector3df(0, 0, 0),
  scale = vector3df(1, 1, 1)): PIVolumeLightSceneNode
  {. header: irr, importcpp: "addVolumeLightSceneNode" .}

proc createTextureAnimator*(mgr: PISceneManager, arr: Array[PTexture],
  timePerFrame: cint, loop = true): PISceneNodeAnimator
  {. header: irr, importcpp: "createTextureAnimator" .}

proc setShadowColor*(mgr: PISceneManager, color = SColor(150, 0, 0, 0))
  {. header: irr, importcpp: "setShadowColor" .}

#proc drop*(node: PISceneNodeAnimator) {. header: irr, importcpp: "drop" .}

proc setPosition*[T: PISceneNode or PIAnimatedMeshSceneNode or
  PIParticleSystemSceneNode or PIVolumeLightSceneNode](node: T,
  pos: Vector3df) {. header: irr, importcpp: "setPosition" .}
proc setPosition*[T: PIMeshSceneNode or PIBillboardSceneNode](node: T,
  pos: Vector3df) {. header: irr, importcpp: "setPosition" .}

proc setTriangleSelector*[T: PIMeshSceneNode or PIAnimatedMeshSceneNode](node: T,
  selector: PITriangleSelector) {. header: irr,
  importcpp: "setTriangleSelector" .}

proc onRegisterSceneNode*(node: PISceneNode) {. header: irr,
  importcpp: "OnRegisterSceneNode" .}
proc render*(node: PISceneNode) {. header: irr, importcpp: "render" .}

proc getBoundingBox*(node: PISceneNode): AabBox3df {. header: irr,
  importcpp: "getBoundingBox" .}

proc setMaterialTexture*[T: PISceneNodeAnimator or PISceneNode or
  PIAnimatedMeshSceneNode or PIBillboardSceneNode or
  PIParticleSystemSceneNode](node: T, textureLayer: uint32,
  texture: PTexture) {. header: irr, importcpp: "setMaterialTexture" .}
proc setMaterialFlag*[T: PISceneNode or PIBillboardSceneNode or
  PIAnimatedMeshSceneNode or PIParticleSystemSceneNode or
  PIShadowVolumeSceneNode ](node: T, flag: MaterialFlag, newvalue: bool)
  {. header: irr, importcpp: "setMaterialFlag" .}
proc getMaterialCount*(node: PISceneNode): int {. header: irr,
  importcpp: "getMaterialCount" .}
proc getMaterial*[T: PISceneNode or PIAnimatedMeshSceneNode](node: var T,
  which: int): SMaterial {. header: irr, importcpp: "getMaterial" .}
#proc drop*(node: PISceneNode) {. header: irr, importcpp: "drop" .}
proc addAnimator*[T: PISceneNode or PILightSceneNode or
  PIAnimatedMeshSceneNode or PCameraSceneNode or PIVolumeLightSceneNode,
  R: PISceneNodeAnimator or PISceneNodeAnimatorCollisionResponse](node: T,
  anim: R) {. header: irr, importcpp: "addAnimator" .}

proc getID*(n: PISceneNode): cint {. header: irr, importcpp: "getID" .}

proc setAnimationSpeed*[T: int or float](node: PIAnimatedMeshSceneNode,
  speed: T) {. header: irr, importcpp: "setAnimationSpeed" .}
proc setRotation*(node: PIAnimatedMeshSceneNode, vect: Vector3df) {.
  header: irr, importcpp: "setRotation" .}


proc addStaticText*(gui: PIGUIEnvironment, text: ptr wchar_t, pos: Rect,
  what: bool) {. header: irr, importcpp: "addStaticText" .}
proc drawAll*(gui: PIGUIEnvironment) {.
  header: irr, importcpp: "drawAll" .}
proc getBuiltInFont*(env: PIGUIEnvironment): PIGUIFont {.header: irr,
  importcpp: "getBuiltInFont".}
proc getFont*(env: PIGUIEnvironment, path: cstring): PIGUIFont {.
  header: irr, importcpp: "getFont".}

proc setMaterial*(driver: PIVideoDriver, material: SMaterial) {.
  header: irr, importcpp: "setMaterial" .}
proc setTransform*(driver: PIVideoDriver, state: TransformationState,
  matrix: Matrix4) {. header: irr, importcpp: "setTransform" .}
proc drawIndexedTriangleList*(driver: PIVideoDriver,
  vertices: ptr S3DVertex, vertexCount: int, indexList: ptr seq[uint16],
  triangleCount: uint32) {. header: irr,
  importcpp: "drawIndexedTriangleList" .}

proc setFrameLoop*(node: PIAnimatedMeshSceneNode, start, toend: cint) {.
  header: irr, importcpp: "setFrameLoop" .}
  
proc beginScene*(driver:PIVideoDriver, what1, what2: bool, color:TColor) {.
  header: irr, importcpp: "beginScene" .}
proc endScene*(driver:PIVideoDriver) {.
  header: irr, importcpp: "endScene" .}
proc makeColorKeyTexture*(driver: PIVideoDriver, img: PTexture,
  pos = position2d(0, 0)) {.header: irr, importcpp: "makeColorKeyTexture".}

proc draw2DImage*(driver: PIVideoDriver, img: PTexture, pos: Position2d,
  sourceRect: Rect, clipRect: ptr Rect = nil,
  color = SColor(255, 255, 255, 255), withAlphaChannel = false) {.
  header: irr, importcpp: "draw2DImage".}
proc draw2DRectangle*(driver: PIVideoDriver, color: TColor, rect: Rect) {.
  header: irr, importcpp: "draw2DRectangle" .}
proc draw3DTriangle*(d: PIVideoDriver, t: Triangle3df, c: TColor) {.
  header: irr, importcpp: "draw3DTriangle" .}

proc addFileArchive*(filesys: PFileSystem, path: cstring, ignoreCase = true,
  ignorePaths = true, archiveType = fat_UNKNOWN, password: cstring = "",
  retArchive: ptr PFileArchive = nil): bool {.
    header: irr, importcpp: "addFileArchive" .}
proc addZipFileArchive*(filesys: PFileSystem, path: cstring,
  ignoreCase = true, ignorePaths = true): bool {.
    header: irr, importcpp: "addZipFileArchive" deprecated .}

proc setVisible*(cur: PICursorControl, visible: bool) {.
  header: irr, importcpp: "setVisible" .}
proc getPosition*(cur: PICursorControl): Position2d {. header: irr,
  importcpp: "getPosition" .}

proc newMaterial*() {.header: irr, importc: "irr::video::SMaterial".}

proc `$`*(str: ptr wchar_t): string =
  result = $(cast[WideCString](str))

proc getTime*(timer: PITimer): uint32 {.header: irr, importcpp: "getTime".}

proc draw*(font: PIGUIFont, text: ptr wchar_t, rect: Rect, color: TColor) {.
  header: irr, importcpp: "draw" .}

proc setTarget*(cam: PCameraSceneNode, vect: Vector3df) {. header: irr,
  importcpp: "setTarget" .}
proc setPosition*(cam: PCameraSceneNode, vect: Vector3df) {. header: irr,
  importcpp: "setPosition" .}
proc getTarget*(cam: PCameraSceneNode): Vector3df {. header: irr,
  importcpp: "getTarget" .}
proc getPosition*(cam: PCameraSceneNode): Vector3df {. header: irr,
  importcpp: "getPosition" .}
proc setFarValue*(cam: PCameraSceneNode, val: cfloat) {. header: irr,
  importcpp: "setFarValue" .}

proc setMaterialType*[T: PISceneNode or PIBillboardSceneNode or
  PIParticleSystemSceneNode] (bill: T, mtrFlag: MaterialType)
  {. header: irr, importcpp: "setMaterialType" .}
proc setSize*(bill: PIBillboardSceneNode, size: Vector2df) {. header: irr,
  importcpp: "setSize" .}
proc setID*(bill: PIBillboardSceneNode, id: cint) {. header: irr,
  importcpp: "setID" .}

proc setTexture*(mtr: SMaterial, layer: cint, texture: PTexture) {.
  header: irr, importcpp: "setTexture" .}
proc `lighting=`*(m: var SMaterial, newval: bool) {.header: irr,
  importcpp: "#.Lighting = #" .}
proc `normalizeNormals=`*(m: var SMaterial, newval: bool) {.header: irr,
  importcpp: "#.NormalizeNormals = #" .}
proc `wireframe=`*(m: var SMaterial, newval: bool) {.header: irr,
  importcpp: "#.Wireframe = #" .}

proc setScale*[T: PIAnimatedMeshSceneNode or PIParticleSystemSceneNode or
  PIVolumeLightSceneNode or PIShadowVolumeSceneNode]( nd: T,
  scale: Vector3df) {. header: irr, importcpp: "setScale" .}
proc setMD2Animation*(nd: PIAnimatedMeshSceneNode, flag: MD2AnimationType)
  {. header: irr, importcpp: "setMD2Animation" .}
proc addShadowVolumeSceneNode*(nd: PIAnimatedMeshSceneNode,
  mesh: PIMesh = nil, id: cint = -1, zfailmethod = true,
  infinity: cfloat = 1000.0): PIShadowVolumeSceneNode {. header: irr,
  importcpp: "addShadowVolumeSceneNode" .}

proc `start=`*(line: var Line3d, val: Vector3df) =
  line.start = val
proc start*(line: Line3d): Vector3df {.inline.} =
  line.start
proc `end=`*(line: var Line3d, val: Vector3df) =
  line.`end` = val
proc `end`*(line: Line3d): Vector3df {.inline.} =
  line.`end`

proc getSceneNodeAndCollisionPointFromRay*(mgr: PISceneCollisionManager,
  ray: Line3d, outCollPoint: Vector3df, outTri: Triangle3df,
  idBitMask = 0, collRootNode: PISceneNode = nil,
  noDebugObjects = false): PISceneNode {. header: irr,
  importcpp: "getSceneNodeAndCollisionPointFromRay" .}

proc makePlanarTextureMapping*(mpr: PIMeshManipulator, mesh: PIMesh,
  resolution: cfloat = 0.001) {.header: irr,
  importcpp: "makePlanarTextureMapping" .}

proc createBoxEmitter*(ps: PIParticleSystemSceneNode,
  box = aabbox3df(-10.0, 28.0, -10.0, 10.0, 30.0, 10.0),
  direction = vector3df(0.0, 0.03, 0.0),
  minParticlesPerSecond: cuint = 5, maxParticlesPerSecond: cuint = 10,
  minStartColor = SColor(255, 0, 0, 0),maxStartColor = SColor(255, 0, 0, 0),
  lifeTimeMin: cuint = 2000, lifeTimeMax: cuint = 4000,
  maxAngleDegrees: cint = 0,
  minStartSize = dimension2df(5, 5),
  maxStartSize = dimension2df(5, 5)): PIParticleBoxEmitter {.
  header: irr, importcpp: "createBoxEmitter" .}

proc setEmitter*(ps: PIParticleSystemSceneNode, em: PIParticleBoxEmitter)
  {. header: irr, importcpp: "setEmitter" .}

proc addAffector*[R: PIParticleAffector or
  PIParticleFadeOutAffector](ps: PIParticleSystemSceneNode,
  pf: R) {. header: irr, importcpp: "addAffector" .}

proc createFadeOutParticleAffector*(ps: PIParticleSystemSceneNode,
  targetColor = SColor(0, 0, 0, 0),
  timeNeededToFadeOut: cuint = 1000): PIParticleFadeOutAffector
  {. header: irr, importcpp: "createFadeOutParticleAffector" .}

proc main() =
  var
    device = createDevice(dtEDT_DIRECT3D9, dimension2du(640, 480), 16)
    driver = device.getVideoDriver()
    scMgr = device.getSceneManager()
    gui = device.getGUIEnvironment()
    mesh = scMgr.getMesh(irrPath & "/sydney.md2")
    node = scMgr.addAnimatedMeshSceneNode(mesh)

  device.setWindowCaption(toWChar(newWideCString(
    "Hello world! - Irrlicht Engine Demo")))
  gui.addStaticText(toWChar(newWideCString(
    "Hello world! This is Irrlicht software engine!")),
    rect(10, 10, 200, 22), true)

  if node != nil:
    node.setMaterialFlag(EMF_LIGHTING, false)
    node.setFrameLoop(0, 310)
    node.setMaterialTexture(0, driver.getTexture(irrPath & "/sydney.bmp"))

  scMgr.addCameraSceneNode(0, vector3df(0, 30, -40), vector3df(0, 5, 0))
  while device.run():
    driver.beginScene(true, true, SColor(255, 100, 101, 140))
    scMgr.drawAll()
    gui.drawAll()
    driver.endScene

  device.drop()

when isMainModule:
  main()
