

size(500, 500);

loadPixels();

PVector centerPos = new PVector(width/2, height/2);

for (int x = 0; x < width; x++ ) 
{
  // Loop through every pixel row
  for (int y = 0; y < height; y++ ) {

    // Use the formula to find the 1D location
    int loc = x + y * width; 
    
    PVector pixelPos = new PVector(x,y);
    float dist  = PVector.dist(centerPos, pixelPos);
    float bright = exp(-dist*0.1);

    pixels[loc] = color(bright*255);
  }
}

updatePixels();