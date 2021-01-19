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

  noFill();
  strokeWeight(5);
}

  int count = 0;

void draw()
{
  background(255);

  stroke(255,0,0);

  for (int i=0; i < ballArray.size(); i++) 
  {
    ballArray.get(i).visualize();
  }

    if(count > 100)
    {
        PVector randomPos = new PVector(random(0, width), random(0, height));
        ballArray.add(new Ball(randomPos));
        count = 0;
    }
    count ++;

}

void mouseClicked() {

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
        ellipse(pos.x, pos.y, 100, 100);
    }

    PVector ball_pos()
    {
        return pos;
    }

}