import processing.video.*;

Capture cam;

void setup() 
{
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    cam = new Capture(this, cameras[0]);

    cam.start();
  }
}

void draw() 
{
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, width, height);
  saveFrame("frames/line-#####.png");

}