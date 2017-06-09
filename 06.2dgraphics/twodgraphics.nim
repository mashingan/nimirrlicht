import ../irrlicht

#proc `/`(x, y: uint32): uint32 = x / y

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
 
  var device = createDevice(driverType, dimension2du(512, 384))
  if (device == nil):
    quit "Device cannot be instantiated", -1

  device.setWindowCaption(toWChar newWideCString(
    "Irrlicht Engine - 2D Graphics Demo"))
  var
    driver = device.getVideoDriver()
    images = driver.getTexture(irrPath & "/2ddemo.png")
    font1 = device.getGUIEnvironment().getBuiltInFont()
    font2 = device.getGUIEnvironment().getFont(irrPath & "/fonthaettenschweiler.bmp")
    imp1 = rect(349, 15, 385, 78)
    imp2 = rect(387, 15, 423, 78)

  driver.makeColorKeyTexture(images)

  let
    txt1 = toWChar newWideCString("This is some text.")
    txt2 = toWChar newWideCString("This is some other text.")

  while device.run() and device != nil:
    if device.isWindowActive():
      let time = device.getTimer().getTime()
      driver.beginScene(true, true, SColor(0, 120, 102, 136))

      # draw fire and dragons background world
      driver.draw2DImage(images, position2d(50, 50), rect(0,0,342,224),
        nil, SColor(255, 255, 255, 255), true);

      # draw flying imp1
      driver.draw2DImage(images, position2d(164, 125),
        if (time div 500'u32) mod 2 == 1: imp1 else: imp2, nil,
        SColor(255, 255, 255, 255), true)

      # draw flying imp2 with colorcycle
      driver.draw2DImage(images, position2d(270, 105),
        if (time div 500'u32) mod 2 == 1: imp1 else: imp2, nil,
        SColor(255, cast[cint](time mod 255), 255, 255), true)

      if font1 != nil:
        font1.draw(txt1, rect(130, 10, 300, 50), SColor(255, 255, 255, 255))

      if font2 != nil:
        font2.draw(txt2, rect(130, 20, 300, 60),
          SColor(255, cast[cint](time mod 255), cast[cint](time mod 255), 255))

      driver.draw2DImage(images, position2d(10, 10),
        rect(354, 87, 442, 118))

      let pos = device.getCursorControl().getPosition()
      {.emit: [driver, "->draw2DRectangle(", SColor(100, 255, 255, 255),
        ", irr::core::rect<irr::s32>(", pos, ".X-20, ", pos, ".Y-20, ",
        pos, ".X+20, ", pos, ".Y+20));"],
      .}

      driver.endScene
  device.drop()

main()
