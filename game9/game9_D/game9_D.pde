import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Movie video;
Capture cam;

PVector ballPos;

void setup() 
{
  size(568, 320);
  // video = new Movie(this, "sample1.mov");
  opencv = new OpenCV(this, 568, 320);
  // video.loop();
  // video.play();

    String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 568, 320);
  } else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    cam = new Capture(this, cameras[0]);

    cam.start();
  }

  ballPos = new PVector(width/2, height/2);
}


void draw() 
{
  background(0);

    if (cam.available() == true) {
    cam.read();
  }

    opencv.loadImage(cam);

    opencv.calculateOpticalFlow();

    stroke(255, 0, 0);

    opencv.drawOpticalFlow();

    PVector aveFlow = opencv.getAverageFlow();
    int flowScale = 50;

    stroke(255);
    strokeWeight(2);
    line(cam.width/2, cam.height/2, cam.width/2 + aveFlow.x * flowScale, cam.height / 2 + aveFlow.y * flowScale);

    stroke(0);
    PVector vec = opencv.getFlowAt(int(ballPos.x), int(ballPos.y));
    ballPos.add(vec.div(3));

    ellipse(ballPos.x, ballPos.y, 100, 100);

}