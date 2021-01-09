void setup() 
{
  size(500, 500);    //window size
  background(255);    //background color

  noFill();

  for(int i = 0; i < int(random(10, 20)); i++)
  {
      myFunc2(i*350);
  }
}

void myFunc2(float x) 
{
    pushMatrix();
    scale(0.15); 

    strokeWeight(9);  //line weight
    stroke(50, 200, 50);  //line color RGB
    rect( x+0,0,300, 250);
    rect( x+50,100,30, 30);//left eye
    rect( x+220,100,30, 30);//right eye
    rect( x+80, 180, 150, 20);//mouth        

    popMatrix();
}
