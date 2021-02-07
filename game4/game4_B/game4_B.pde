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

float speed = 2;

void draw()
{
  background(0);

  PVector dir = new PVector(mouseX - bx, mouseY - by); 
  dir.normalize();
   
  bx += dir.x * speed;
  by += dir.y * speed;

  ellipse(bx, by, bs, bs);
}

