PVector [] pos = new PVector[5];
ArrayList<PVector> po = new ArrayList<PVector>();
ArrayList<Ball> ballArray = new ArrayList<Ball>();

void setup() 
{
  size(1000, 800);

  for (int i=0; i < 5; i++) 
  {
    PVector ballPos = new PVector(i*110, 100);
    ballArray.add(new Ball(ballPos));
  }
}

int count = 0;
boolean  clearFlag = false;

void draw()
{
    background(255);

    stroke(255,0,0);

    for (int i=0; i < ballArray.size(); i++) 
    {
        ballArray.get(i).visualize();
        ballArray.get(i).move();
    }

    if(count > 300 && !clearFlag)
    {
        PVector randomPos = new PVector(random(0, width), random(0, height));
        ballArray.add(new Ball(randomPos));
        count = 0;
    }

    count ++;

    if(ballArray.size() == 0)
    {
        clearFlag = true;
        fill(0);
        textSize(16);
        text("CLEAR", 10, 35);
    }else{
        fill(0);
        textSize(16);
        text("Click to Remove Balls", 10, 35);
    }

}

void mouseClicked() 
{

  float range = 50;

  if (ballArray.size()>0) 
  {
    for(int i = 0; i < ballArray.size(); i++)
    {
       if(mouseX - range < ballArray.get(i).ball_pos().x 
        && ballArray.get(i).ball_pos().x < mouseX + range 
        && mouseY - range < ballArray.get(i).ball_pos().y
        && ballArray.get(i).ball_pos().y < mouseY + range)
       {
             ballArray.remove(i);
       }
    }
  }
}

class Ball
{
    PVector pos;
   
    Ball(PVector ballPos)
    {
        pos = ballPos;
    }

    void visualize()
    {
        noFill();
        strokeWeight(5);
        ellipse(pos.x, pos.y, 100, 100);
    }

    PVector vel = new PVector(random(1, 3), random(1, 3));

    void move()
    {
        pos.x += vel.x;
        pos.y += vel.y;

        if(pos.x < 0 || width < pos.x || pos.y < 0 || height < pos.y)
        {
            vel.x *= -1;
            vel.y *= -1;
        }
    }

    PVector ball_pos()
    {
        return pos;
    }

}