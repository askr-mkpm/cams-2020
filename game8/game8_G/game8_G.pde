ArrayList<Metaball> metaballs;

void setup(){
  size(500,500);
  metaballs = new ArrayList<Metaball>();

  for(int i = 0; i < 10; i++)
  {
    metaballs.add(new Metaball(new PVector(random(width), random(height)), 70f));
  }
}

void draw(){
  background(0);

    for (int i=0; i < metaballs.size(); i++) 
    {
      Metaball b = metaballs.get(i);
      b.pos.x += sin(millis()/1000 + i)*5;
      b.pos.y += cos(millis()/1000 - i)*3;
    }

  loadPixels();
  //↓全ての画素を見るfor分
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int index = x + y * width;
      float sum = 0;

      //↓一つの画素に対し、すべてのmetaballからの距離を積算している。      
      //for (Blob b : blobs) {//←蛇足：以下2行の代わりにこのようにも書ける
      for (int i=0; i < metaballs.size(); i++) {
        Metaball b = metaballs.get(i);
        //↓画素からボール中心への距離
        float d = dist(x, y, b.pos.x, b.pos.y);    
        sum += 40 * b.radi / d;;
      }

      //２．

      int N = 4;
      float p = 255/float(N-1);

      sum = floor((sum/255) * N) * p;
      
      pixels[index] = color(sum);
      //pixels[index] = color(sum, 255, 255);
    }
  }
  updatePixels();
}

class Metaball
{
  PVector pos;
  float radi;

  Metaball(PVector pos0, float radi0){
    pos = pos0;
    radi = radi0;
  }  
}