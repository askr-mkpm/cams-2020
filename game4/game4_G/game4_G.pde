float halfWidth;//画面の横幅の半分
float halfHeight;//画面の縦幅の半分
final float PI = acos(-1);

void settings()
{
    size(500, 500);

    halfWidth = width / 2;
    halfHeight = height / 2;
}

final int ballNum = 5;
PVector[] ballPos = new PVector[ballNum];

float bs = 30;

PVector dir[] = new PVector[ballNum];
float speed = 0.02;
float len = 80; //length of vector

void setup()
{
  for(int i = 0; i < ballNum; i++)
  {
    ballPos[i] = new PVector(i*100,0);
  }
    
    strokeWeight(2);
    stroke(255,0,0);
}

void draw()
{
  background(0);

  for(int i = 0; i < ballNum; i++)
  {
    dir[i] = new PVector(mouseX - ballPos[i].x, mouseY - ballPos[i].y);

    ballPos[i].x += dir[i].x * speed;
    ballPos[i].y += dir[i].y * speed;

    ellipse(ballPos[i].x, ballPos[i].y, bs, bs);

    line(ballPos[i].x, ballPos[i].y, ballPos[i].x + dir[i].normalize().x * len, ballPos[i].y + dir[i].normalize().y * len);  
  }
}

