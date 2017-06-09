import ../irrlicht

proc main() =
  var driverType: DriverType = dtEDT_DIRECT3D9
  
  echo """Please select the driver you want for this example:
 (a) Direct3D 9.0c
 (b) Direct3D 8.1
 (c) OpenGL 1.5
 (d) Software Renderer
 (e) Apfelbaum Software Renderer
 (f) nullDevice
 (otherkey) exit"""
 
  case readLine(stdin)
  of "a": driverType = dtEDT_DIRECT3D9
  of "b": driverType = dtEDT_DIRECT3D8
  of "c": driverType = dtEDT_OPENGL
  of "d": driverType = dtEDT_SOFTWARE
  of "e": driverType = dtEDT_BURNINGSVIDEO
  of "f": driverType = dtEDT_NULL
  else: quit 1
 
  var
    device = createDevice(driverType, stencilBuffer = true)
    driver = device.getVideoDriver()
    smgr = device.getSceneManager()
    mesh = smgr.getMesh(irrPath & "/room.3ds")
    node = smgr.addAnimatedMeshSceneNode mesh

  #[
  {.emit: [smgr, "->getMeshManipulator()->makePlanarTextureMapping(",
  mesh.getMesh(0), ", 0.004);"] .}
  ]#
  smgr.getMeshManipulator().makePlanarTextureMapping(
    mesh.getMesh(0), 0.004)
  node.setMaterialTexture(0, driver.getTexture(irrPath & "/wall.jpg"))
  {.emit: [node, "->getMaterial(0).SpecularColor.set(0,0,0,0);"] .}

  mesh = smgr.addHillPlaneMesh(cstring("myHill"),
    dimension2df(20, 20),
    dimension2du(40, 40), nil, 0,
    dimension2df(0, 0),
    dimension2df(10, 10))

  var node2 = smgr.addWaterSurfaceSceneNode(mesh.getMesh(0), 3.0, 300.0,
    30.0)
  node2.setPosition(vector3df(0, 7, 0))
  node2.setMaterialTexture(0, driver.getTexture(irrPath & "/stones.jpg"))
  node2.setMaterialTexture(1, driver.getTexture(irrPath & "/water.jpg"))
  node2.setMaterialType(mtReflection2Layer)

  var
    node3 = smgr.addLightSceneNode(nil, vector3df(0,0,0),
      SColor(1.0, 0.6, 0.7, 1.0), 800.0)
    anim = smgr.createFlyCircleAnimator(vector3df(0,150,0), 250.0)
  node3.addAnimator(anim)
  anim.drop()

  var
    node4 = smgr.addBillboardSceneNode(cast[PISceneNode](node3),
      dimension2df(50,50))
    ps = smgr.addParticleSystemSceneNode(false)

  node4.setMaterialFlag(EMF_LIGHTING, false)
  node4.setMaterialType(mtTransparentAddColor)
  node4.setMaterialTexture(0, driver.getTexture(irrPath &
    "/particlewhite.bmp"))
  ps.setPosition(vector3df(-70, 60, 40))
  ps.setScale(vector3df(2, 2, 2))

  var em = ps.createBoxEmitter(aabbox3df(-7, 0, -7, 7, 1, 7),
    vector3df(0.0, 0.6, 0.0), 80, 100, SColor(0, 255, 255, 255),
    SColor(0, 255, 255, 255), 800, 2000, 0,
    dimension2df(5, 5), dimension2df(20, 10))
  ps.setEmitter(em)
  em.drop()

  var paf = ps.createFadeOutParticleAffector()
  ps.addAffector(paf)
  paf.drop()

  ps.setMaterialFlag(EMF_LIGHTING, false)
  ps.setMaterialFlag(EMF_ZWRITE_ENABLE, false)
  ps.setMaterialTexture(0, driver.getTexture(irrPath & "/fire.bmp"))
  ps.setMaterialType(mtTransparentVertexAlpha)

  var nvl = smgr.addVolumeLightSceneNode(id = 1,
    foot = SColor(0, 255, 255, 255))

  if nvl != nil:
    nvl.setScale(vector3df(56, 56, 56))
    nvl.setPosition(vector3df(-120, 50, 40))

    var textures: Array[PTexture]
      #[
    for i in countdown(7, 1):
      var str: cstring = irrPath & "/portal" & $i & ".bmp"
      textures.push_back driver.getTexture(str)
      ]#
    {.emit: ["""for (irr::s32 g=7; g > 0; --g) {
    irr::core::stringc tmp = "d:/installer/irrlicht/media";
    tmp += "/portal";
    tmp += g;
    tmp += ".bmp";
    irr::video::ITexture *t = """, driver, """->getTexture(tmp.c_str());
    """, textures, """.push_back(t);
    }"""
    ] .}

    var glow = smgr.createTextureAnimator(textures, 150)
    nvl.addAnimator glow
    glow.drop()

  mesh = smgr.getMesh(irrPath & "/dwarf.x")
  var anode = smgr.addAnimatedMeshSceneNode(mesh)
  anode.setPosition vector3df(-50, 20, -60)
  anode.setAnimationSpeed 15

  discard anode.addShadowVolumeSceneNode()
  smgr.setShadowColor SColor(150, 0, 0, 0)

  anode.setScale vector3df(2, 2, 2)
  anode.setMaterialFlag(EMF_NORMALIZE_NORMALS, true)

  var camera = smgr.addCameraSceneNodeFPS()
  camera.setPosition vector3df(-50, 50, -150)
  camera.setFarValue 10000.0

  device.getCursorControl().setVisible false

  var lastFPS = -1
  while device.run():
    if device.isWindowActive():
      driver.beginScene(true, true, SColor(255, 100, 101, 140))
      smgr.drawAll()
      driver.endScene

      let fps = driver.getFPS()
      if lastFPS != fps:
        {.emit: ["""
          irr::core::stringw str =
          L"Irrlicht Engine - SpecialFX example [";
          str += """,driver,"""->getName();
          str += "] FPS:";
          str += """,fps,""";
          """,device,"""->setWindowCaption(str.c_str());
          """] .}
        lastFPS = fps

  device.drop()

main()
