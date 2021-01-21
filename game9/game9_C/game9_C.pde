// Example 15-6: Setting pixels according to their 2D location

size(500, 500);
loadPixels();

// Two loops allow us to visit every column (x) and every row (y).

// Loop through every pixel column
for (int x = 0; x < width; x++ ) 
{
  // Loop through every pixel row
  for (int y = 0; y < height; y++ ) {

    // Use the formula to find the 1D location
    int loc = x + y * width; 
    int pixCol = pixels[loc];  

    float r = red(pixCol);   
    float g = green(pixCol);
    float b = blue(pixCol);  

    // If even column
    if (x % 2 == 0) { 
      pixels[loc] = color(r, 0, b);;
      
      // If odd column
    } else { 
      pixels[loc] = color(0);
    }
  }
}

  updatePixels();