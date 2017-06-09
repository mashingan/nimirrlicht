import ../irrlicht

const
  IdIsNotPickable = 0
  IdIsPickable = 1 shl 0
  IdIsHighlightable = 1 shl 1

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
    device = createDevice(driverType)
    driver = device.getVideoDriver()
    smgr = device.getSceneManager()
    q3mesh: PIAnimatedMesh = nil
    
  if not device.getFileSystem().addFileArchive(irrPath & "/map-20kdm2.pk3",
    archiveType = fat_ZIP):
    echo "Error in reading file type"
    device.drop()
    quit 1
  else:
    q3mesh = smgr.getMesh("20kdm2.bsp")

  var q3node = smgr.addOctreeSceneNode(q3mesh.getMesh(0))
  q3node.setPosition(vector3df(-1370, -130, -1400))
  var selector = smgr.createOctreeTriangleSelector(q3mesh.getMesh(0),
      q3node, 128)
  q3node.setTriangleSelector(selector)

  var camera = smgr.addCameraSceneNodeFPS(moveSpeed = 0.3,
      noVerticalMovement = true)
  camera.setPosition vector3df(50.0, 50.0, -60.0)
  camera.setTarget vector3df(-70.0, 30.0, -60.0)
  var anim = smgr.createCollisionResponseAnimator(selector, camera,
      vector3df(30, 50, 30), vector3df(0, -3, 0), vector3df(0, 50, 0))
  selector.drop()
  camera.addAnimator(anim)
  anim.drop()

  device.getCursorControl().setVisible(false)

  var bill = smgr.addBillboardSceneNode()
  bill.setMaterialTexture(0, driver.getTexture(irrPath & "/particle.bmp"))
  bill.setMaterialFlag EMF_LIGHTING, false
  bill.setSize vector2df(20.0, 20.0)
  bill.setID 0

  #GC_disable()
  var material: SMaterial
  material.setTexture(0, driver.getTexture(irrPath & "/faerie2.bmp"))
  material.lighting = true
  material.normalizeNormals = true

  var
    node: PIAnimatedMeshSceneNode
    #[
    faerie = smgr.getMesh(irrPath & "/faerie.md2")
    ninja = smgr.getMesh(irrPath & "/ninja.b3d")
    dwarf = smgr.getMesh(irrPath & "/dwarf.x")
    yodan = smgr.getMesh(irrPath & "/yodan.mdl")
    ]#
    mtr: SMaterial


  # node faerie
  node = smgr.addAnimatedMeshSceneNode(smgr.getMesh(irrPath & "/faerie.md2"))
  #node = smgr.addAnimatedMeshSceneNode(faerie)
  node.setPosition vector3df(-90, -15, -140)
  node.setScale vector3df(1.6, 0, 0)
  node.setAnimationSpeed(20.0)
  node.setMD2Animation(md2Point)
  {.emit: [node, "->getMaterial(0) = ", material, ";"] .}
  #[
  node.getMaterial(0).normalizeNormals = true
  node.getMaterial(0).lighting = true
  ]#
  #[
  mtr = node.getMaterial(0)
  mtr.normalizeNormals = true
  mtr.lighting = true
  ]#
  selector = smgr.createTriangleSelector node
  node.setTriangleSelector selector
  selector.drop()

  # node ninja
  node = smgr.addAnimatedMeshSceneNode(smgr.getMesh(irrPath & "/ninja.b3d"))
  #node = smgr.addAnimatedMeshSceneNode(ninja)
  node.setPosition vector3df(-75, -66, -80)
  node.setScale vector3df(10, 0, 0)
  node.setRotation vector3df(0, 90, 0)
  node.setAnimationSpeed 8.0 
  {.emit: [node, "->getMaterial(0).NormalizeNormals = true;",
    node, "->getMaterial(0).Lighting = true;"] .}
  #[
  node.getMaterial(0).normalizeNormals = true
  node.getMaterial(0).lighting = true
  ]#
  #[
  mtr = node.getMaterial 0 
  mtr.normalizeNormals = true
  mtr.lighting = true
  ]#
  selector = smgr.createTriangleSelector node
  node.setTriangleSelector selector
  selector.drop()

  # node dwarf
  node = smgr.addAnimatedMeshSceneNode(smgr.getMesh(irrPath & "/dwarf.x"))
  #node = smgr.addAnimatedMeshSceneNode(dwarf)
  node.setPosition vector3df(-70, -66, -30)
  node.setScale vector3df(10, 0, 0)
  node.setRotation vector3df(0, -90, 0)
  node.setAnimationSpeed 20
  {.emit: [node, "->getMaterial(0).Lighting = true;"] .}
  #[
  node.getMaterial(0).normalizeNormals = true
  node.getMaterial(0).lighting = true
  ]#
  #[
  mtr = node.getMaterial 0 
  mtr.lighting = true
  ]#
  selector = smgr.createTriangleSelector node
  node.setTriangleSelector selector
  selector.drop()

  # node yodan
  node = smgr.addAnimatedMeshSceneNode(smgr.getMesh(irrPath & "/yodan.mdl"))
  #node = smgr.addAnimatedMeshSceneNode(yodan)
  node.setPosition vector3df(-90, -25, 20)
  node.setScale vector3df(0.8, 0, 0)
  node.setRotation vector3df(0, -90, 0)
  node.setAnimationSpeed 20
  {.emit: [node, "->getMaterial(0).Lighting = true;"] .}
  #[
  node.getMaterial(0).normalizeNormals = true
  node.getMaterial(0).lighting = true
  ]#
  #[
  mtr = node.getMaterial 0 
  mtr.lighting = true
  ]#
  selector = smgr.createTriangleSelector node
  node.setTriangleSelector selector
  selector.drop()

  material.setTexture(0, nil)
  material.lighting = false

  var
    light = smgr.addLightSceneNode(position = vector3df(-60, 100, 400),
      radius = 600.0, id = 0)
    selectedSceneNode: PISceneNode = nil
    highlightedSceneNode: PISceneNode = nil
    collmgr = smgr.getSceneCollisionManager()
    intersection = vector3df(0, 0, 0)
    triangle = triangle3df()
    line: Line3d

  material.wireframe = true

  var lastFPS = -1
  while device.run():
    if device.isWindowActive():
      driver.beginScene(true, true, SColor(255, 100, 101, 140))
      smgr.drawAll()
      if highlightedSceneNode != nil:
        highlightedSceneNode.setMaterialFlag EMF_LIGHTING, true
        highlightedSceneNode = nil

      line.start = camera.getPosition()
      line.`end` = line.start +
        (camera.getPosition() - line.start).normalize() * float(1000.0)

      selectedSceneNode = collmgr.getSceneNodeAndCollisionPointFromRay(line,
        intersection, triangle, IdIsPickable)

      if selectedSceneNode != nil:
        bill.setPosition(intersection)
        driver.setTransform(tsWorld, matrix4())
        driver.setMaterial(material)
        driver.draw3DTriangle triangle, SColor(0, 255, 0, 0)

        if (selectedSceneNode.getID and IdIsHighlightable) ==
          IdIsHighlightable:
          highlightedSceneNode = selectedSceneNode
          highlightedSceneNode.setMaterialFlag EMF_LIGHTING, false

      driver.endScene

      let fps = driver.getFPS()
      if lastFPS != fps:
        {.emit: ["""
          irr::core::stringw str =
          L"Collision detection example - Irrlicht Engine [";
          str += """,driver,"""->getName();
          str += "] FPS:";
          str += """,fps,""";
          """,device,"""->setWindowCaption(str.c_str());
          """] .}
        lastFPS = fps

        #device.setWindowCaption(toWChar(newWideCString(str)))

  device.drop()
  #GC_enable()

main()
