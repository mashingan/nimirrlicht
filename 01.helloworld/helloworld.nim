import ../irrlicht

proc main() =
  var
    device = createDevice(dtEDT_DIRECT3D9, dimension2du(640, 480),
      16.cint, false, false, false, nil)
    driver = device.getVideoDriver()
    scMgr = device.getSceneManager()
    gui = device.getGUIEnvironment()
    mesh = scMgr.getMesh(irrPath & "/sydney.md2")
    node = scMgr.addAnimatedMeshSceneNode(mesh)

  device.setWindowCaption(toWChar(
    newWideCString("Hello world! - Irrlicht Engine Demo")))
  gui.addStaticText(toWChar(
    newWideCString("Hello world! This is Irrlicht software engine!")),
    rect(10, 10, 200, 22), true)

  #[
  {.emit:
    [device, """->setWindowCaption(L"Hello world! - Irrlich Engine Demo");
    """, gui, """->addStaticText(L"Hello world! This Irrlicht software engine!",
    irr::core::rect<irr::s32>(10, 10, 200, 22), true);
"""].}
  ]#


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
