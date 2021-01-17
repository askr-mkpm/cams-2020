int canvasSize_x, canvasSize_y;
float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

void settings()
{
    canvasSize_x = 500;
    canvasSize_y = 500;
    size(canvasSize_x, canvasSize_y);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

PVector ballPos = new PVector(0, 0);
float bs = 30;

float speed = 0.02;
float len = 80; //length of vector  

PVector dir;

void draw()
{
  background(0);

  dir = new PVector(mouseX - ballPos.x, mouseY - ballPos.y);

  ballPos.x += dir.x * speed;
  ballPos.y += dir.y * speed;

  ellipse(ballPos.x, ballPos.y, bs, bs);
}

