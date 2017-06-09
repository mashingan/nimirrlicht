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
    device = createDevice(driverType, dimension2du(640, 480), 16)
    driver = device.getVideoDriver()
    scMgr = device.getSceneManager()
    mesh: PIAnimatedMesh = nil
    
  if not device.getFileSystem().addFileArchive(irrPath & "/map-20kdm2.pk3",
    archiveType = fat_ZIP):
    echo "Error in reading file type"
    device.drop()
    quit 1
  else:
    mesh = scMgr.getMesh("20kdm2.bsp")

  var node = scMgr.addOctreeSceneNode(mesh.getMesh(0))
  node.setPosition(vector3df(-1300, -144, -1249))

  discard scMgr.addCameraSceneNodeFPS()
  device.getCursorControl().setVisible(false)


  var lastFPS = -1
  while device.run():
    driver.beginScene(true, true, SColor(255, 100, 101, 140))
    scMgr.drawAll()
    #gui.drawAll()
    driver.endScene
    let fps = driver.getFPS()
    if lastFPS != fps:
      # TODO: const_cast is solved but because of the conversion it makes
      # the rendering runs very slow
      #[
      var str = "Irrlicht Engine - Quake 3 Map Example [" &
        $driver.getName & "FPS:" & $fps
      ]#
      {.emit: ["""
        irr::core::stringw str = L"Irrlicht Engine - Quake 3 Map Example [";
        str += """,driver,"""->getName();
        str += "] FPS:";
        str += """,fps,""";
        """,device,"""->setWindowCaption(str.c_str());
        """] .}

      #device.setWindowCaption(toWChar(newWideCString(str)))

  device.drop()

main()
