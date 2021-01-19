PVector [] pos = new PVector[5];
ArrayList<PVector> po = new ArrayList<PVector>();

void setup() {
  size(1000, 800);
  for (int i=0; i < 5; i++) {
    //↓ Second new with add
    pos[i] = new PVector(i*110, 300);
    po.add(new PVector(i*110, 100));
    //↑★0: addの仕方について
  }
  noFill();
  strokeWeight(5);
}
void draw() {
  background(255);

  //↓ Static array (green)
  stroke(0,128,0);
  //↓★1: .length of static array
  for (int i=0; i < pos.length; i++) {
    ellipse(pos[i].x, pos[i].y, 100, 100);
  }

  //Dynamic array (red)
  stroke(255,0,0);
  //↓★2: .size()
  for (int i=0; i < po.size(); i++) {
    //↓★3: .get()
    PVector pv = po.get(i);
    //↓★4: use member variables
    ellipse(pv.x, pv.y, 100, 100);

    //↓★5: You can do this instead of 3&4. I recommend 3&4. 
    //ellipse(po.get(i).x, po.get(i).y, 130, 130);
  } 
}
void mouseClicked() {
  //↓★6
  if (po.size()>0) {//if(!po.isEmpty())
     //↓★7

     po.add(new PVector(mouseX, mouseY));
  }
  print(po.size()+", "  );//★See the console
}