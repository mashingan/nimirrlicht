{.passC: "/I.".}

import ../irrlicht

const
  customHeader = "\"CSampleSceneNode.h\""

type
  CSampleSceneNode {.header: customHeader, importc:
    "CSampleSceneNode".} = object


proc newCSampleSceneNode(sceneNode: PISceneNode, mgr: PISceneManager,
  id: cint): ptr CSampleSceneNode {.
  header: customHeader, importcpp: "new CSampleSceneNode(@)".}
proc drop(snode: ptr CSampleSceneNode) {.
  header: customHeader, importcpp: "drop" .}
proc addAnimator(snode: ptr CSampleSceneNode, anim: PISceneNodeAnimator) {.
  header: customHeader, importcpp: "addAnimator" .}

proc main() =
  var
    device = createDevice(dtEDT_DIRECT3D9)
    driver = device.getVideoDriver()
    smgr = device.getSceneManager()
    
  device.setWindowCaption(toWChar newWideCString(
    "Custom Scene Demo - Irrlicht Engine Demo"))
  smgr.addCameraSceneNode(0, vector3df(0, -40, 0), vector3df(0, 0, 0))

  var mynode = newCSampleSceneNode(smgr.getRootSceneNode(), smgr, 666)
  mynode.drop()

  var anim = smgr.createRotationAnimator(vector3df(0.8, 0.0, 0.8))
  mynode.addAnimator(anim)
  anim.drop()
  
  while device.run():
    driver.beginScene(true, true, SColor(0, 100, 0, 100))
    smgr.drawAll()
    driver.endScene()

  device.drop()

main()
