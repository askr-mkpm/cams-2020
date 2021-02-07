Ball ball;

void setup(){
  size(500,500);  
  ball = new Ball();
}

void draw(){
  background(255);
  ball.update();

  // if(mousePressed) {
    ball.addForce();
  // }
}

class Ball{  
  PVector pos;
  float size = 100;
  float radi = size/2.0;
  PVector vel;
  float gravity;
  float air_drag = 0.99f;

  Ball()
  {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    gravity = 0.98f;    
  }
  void update()
  {    
    //update velosity：ここは第1,2回にしたので省略
    // vel.y += gravity;

    vel.x *= air_drag;
    vel.y *= air_drag;
    
    // //update position：ここは第1,2回にしたので省略
    pos.x += vel.x;
    pos.y += vel.y;
    
    //bound：壁とのバウンドは今回なくてもよいです
    if(pos.x < 0 || width < pos.x || pos.y < 0 || height < pos.y)
    {
      vel.x *= -1;
      vel.y *= -1;
    } 
    
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