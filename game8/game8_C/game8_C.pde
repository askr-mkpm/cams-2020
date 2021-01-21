PImage cornell;

void setup() 
{
  size(580, 580);
  
  cornell = loadImage("cornell.jpg");

  cornell.loadPixels();

  for (int x = 0; x < width; x++ ) 
  {
    for (int y = 0; y < height; y++ ) 
    {
      int loc = x + y * width; 
      int pixCol = cornell.pixels[loc];  

      float r = red(pixCol);   
      float g = green(pixCol);
      float b = blue(pixCol);  

      float gray = (r+g+b)/3;

      cornell.pixels[loc] = color(gray); 
    }
  }

  cornell.updatePixels();
}

void draw() 
{
  image(cornell, 0, 0);
}
