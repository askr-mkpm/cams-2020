float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

float bx = 0;
float by = 0;
float bs = 30;

void settings()
{
    size(500, 500);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

void setup()
{
    strokeWeight(2);
    stroke(255,0,0);
}

float speed = 0.02;
float len = 80; //length of vector

void draw()
{
  background(0);

  float dirx = mouseX - bx;
  float diry = mouseY - by;
   
  bx += dirx * speed;
  by += diry * speed;

  ellipse(bx, by, bs, bs);

  float dist = sqrt(sq(mouseX - bx) + sq(mouseY - by));
  float vecx = (mouseX - bx)/dist;
  float vecy = (mouseY - by)/dist;  

  line(bx, by, bx + vecx*len, by + vecy*len);
    
}

