BallLine ballLine;
int xnum=10;//横方向のボールの数

void setup() {
  size(500, 500);
  ballLine = new BallLine(100);
}

void draw() {
  background(255);
  ballLine.update();
}

class BallLine 
{
  Ball[] balls;

  BallLine(int ofssetY) {
    balls = new Ball[xnum];
    for (int i=0; i<balls.length; i++) {
      balls[i] = new Ball(i*30, 100+ofssetY);
    }
  }

  void update() {
    for (int i=0; i<balls.length; i++) {
      balls[i].update();
      if (mousePressed) {
        balls[i].addForce();
      }

      //draw line
      if (i+1<balls.length) {
        PVector a =balls[i].pos; 
        PVector b =balls[i+1].pos;
        line(a.x, a.y, b.x, b.y);
      }
    }
  }
}

class Ball{  
  PVector pos;
  float size = 10;
  float radi = size/2.0;
  PVector vel;
  float gravity;
  float air_drag = 0.7f;

  Ball(float posX, float posY)
  {
    pos = new PVector(posX, posY);
    vel = new PVector(0, 0);
  }
  void update()
  {    
    vel.x *= air_drag;
    vel.y *= air_drag;

    // pos.x += vel.x;
    pos.y += vel.y;
    
    display();
  }

  void display(){
    stroke(0);
    noFill();
    ellipse(pos.x, pos.y, size, size);
  }


  void addForce()
  {    
    float range = 100;
    PVector mousePos = new PVector(mouseX, mouseY);
    float dist = PVector.dist(pos, mousePos);
    if(dist < range)
    {
      PVector dir = PVector.sub(pos, mousePos);
      PVector addVel = PVector.mult(dir, 1/dist);

      vel.add(addVel);
    }
  }
}