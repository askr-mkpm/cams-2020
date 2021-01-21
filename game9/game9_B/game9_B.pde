import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

PImage img;
Capture cam;

OpenCV opencv;
Rectangle[] faces;

void setup() 
{
  size(1080, 720);
  img = loadImage("blackRect.PNG");

  String[] cameras = Capture.list();

  if (cameras == null) 
  {
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

void draw() {

  opencv = new OpenCV(this, cam);
  opencv.loadCascade(OpenCV.CASCADE_EYE);  
  faces = opencv.detect();

  // image(opencv.getInput(), 0, 0);
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, width, height);

  // noFill();
  // stroke(0, 255, 0);
  // strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    image(img, faces[i].x, faces[i].y);
    // rect(faces[i].x, , faces[i].width, faces[i].height);
  }

}