float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

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

PVector ballPos = new PVector(0, 0);
float bs = 30;

PVector dir;
float speed = 0.02;
float len = 80; //length of vector

void draw()
{
  background(0);

  dir = new PVector(mouseX - ballPos.x, mouseY - ballPos.y);

  ballPos.x += dir.x * speed;
  ballPos.y += dir.y * speed;

  ellipse(ballPos.x, ballPos.y, bs, bs);

  line(ballPos.x, ballPos.y, ballPos.x + dir.normalize().x * len, ballPos.y + dir.normalize().y * len);  
}

