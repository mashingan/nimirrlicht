when defined(vcc):
  {.passC: "/I.".}
else:
  {.passC: "-I.".}

import ../irrlicht

const
  evtHdr = "\"MyEventReceiver.h\""

type
  MyEventReceiver {.header: evtHdr, importc: "MyEventReceiver" .} = object


proc myNewEventReceiver(node: PISceneNode): ptr MyEventReceiver {.
  importcpp: "new MyEventReceiver(@)" .}

proc main() =
  var
    device = createDevice(dtEDT_OPENGL)
    driver = device.getVideoDriver()
    smgr = device.getSceneManager()
    node = smgr.addCubeSceneNode()
    receiver = myNewEventReceiver(node)

  device.setEventReceiver(cast[PIEventReceiver](receiver))

  node.setPosition(vector3df(0.0, 0.0, 30.0))
  node.setMaterialFlag(EMF_LIGHTING, false)
  node.setMaterialTexture(0, driver.getTexture(irrPath &
    "/wall.bmp"))

  node.setMaterialFlag(EMF_LIGHTING, false)
  node.setMaterialTexture(0, driver.getTexture(irrPath &
    "/t351sml.jpg"))

  var anim = smgr.createFlyCircleAnimator(vector3df(0.0, 0.0, 30.0), 20.0)
  node.addAnimator(anim)
  anim.drop()

  var anms = smgr.addAnimatedMeshSceneNode(smgr.getMesh(irrPath &
    "/sydney.md2"))
  if node != nil:
    anim = smgr.createFlyStraightAnimator(vector3df(100, 0, 60),
      vector3df(-100.0, 0.0, 60.0), 10000, true)
    anms.addAnimator(anim)
    anim.drop()

    anms.setMaterialFlag(EMF_LIGHTING, false)
    anms.setFrameLoop(320, 360)
    anms.setAnimationSpeed(30)
    anms.setRotation(vector3df(0.0, 180.0, 0.0))
    anms.setMaterialTexture(0, driver.getTexture(
      irrPath & "/sydney.bmp"))

  discard smgr.addCameraSceneNodeFPS(nil, 100.0'f32, 100.0'f32)
  device.getCursorControl().setVisible(false)

  var lastFPS = -1
  while device.run():
    driver.beginScene(true, true, SColor(255,90,90,156))
    smgr.drawAll()
    driver.endScene()

    var fps = driver.getFPS()
    if lastFPS != fps:
      {.emit: ["""
        wchar_t tmp[1024];
        swprintf(tmp, 1024, L"Movement Example - Irrlicht Engine"\
        " (%ls)(fps:%d)", """, driver, """->getName(), """, fps, """);""",
        device, """->setWindowCaption(tmp);
        """]
      .}
      lastFPS = fps

  device.drop()

main()
