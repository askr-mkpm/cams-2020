int count = 0;
int ballnum = 1000;
PVector cen;
float size;

float dist[];
float ang[];
float sizeArr[];

void setup() {
  size(800, 800);
  cen = new PVector();
  cen.x = width/2;
  cen.y = height/2;
  size = 4;

  dist = new float[ballnum];
  ang = new float[ballnum];  
  sizeArr = new float[ballnum];
}

void draw() {
  background(50);

  float angle = 10;

  dist[count]=50;
  ang[count]=angle*count;
  sizeArr[count] = size;

  float theta = 137.5077641;


  for (int i=0; i < count; i++)
  {
    float x = dist[i] * cos(theta/180*ang[i]);
    float y = dist[i] * sin(theta/180*ang[i]);
    
    stroke(255);
    line(400,  400,x+cen.x, y+cen.y);
    dist[i] += 0.4f;
    sizeArr[i] += 0.015f;
  }

  count++;

  if (count>=ballnum)count=0;
}