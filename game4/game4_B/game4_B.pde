int canvasSize_x, canvasSize_y;
float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

float bx = 0;
float by = 0;
float bs = 30;

void settings()
{
    canvasSize_x = 500;
    canvasSize_y = 500;
    size(canvasSize_x, canvasSize_y);

    halfWidth = width / 2;
    halfHeight = height / 2;
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
}

