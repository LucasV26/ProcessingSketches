import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;

Spring s;

Plataform pl, pt, pr, pb, pm;

void setup() {
  size(1200, 600);
  background(0);
  rectMode(CENTER);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  
  s = new Spring();
  
  pl = new Plataform(5, height/2, 5, height, 0);
  pt = new Plataform(width/2, 5, width, 5, 0);
  pr = new Plataform(width-5, height/2, 5, height, 0);
  pb = new Plataform(width/2, height-5, width, 5, 0);
  pm = new Plataform(width/2, height/2, width/2, 5, PI/5);
}

void draw() {
  background(0);
  
  boxes.add(new Box(random(width), random(height)));
  
  box2d.step();
  
  for(Box b : boxes){
    b.show();
  }
  
  s.update(mouseX, mouseY);
  
  s.show();
  
  pl.show();
  pt.show();
  pr.show();
  pb.show();
  pm.show();
  
  fill(255);
  if(mouseX > 10 && mouseX < 70 && mouseY > 20 && mouseY < 40)
    fill(0, 255, 0);
  rect(40, 30, 60, 20);
  fill(0);
  text("Restart", 20, 35);
}

void mousePressed(){
  boolean goOn = true;
  for(Box b : boxes){
    if(b.contains(mouseX, mouseY)){
      s.createJoint(mouseX, mouseY, b); 
      goOn = false;
    }
  }
  
  if(goOn){
    boxes.add(new Box(mouseX, mouseY));
  }
  
  if(mouseX > 10 && mouseX < 70 && mouseY > 20 && mouseY < 40)
    setup();
}

void mouseReleased(){
  s.destroyJoint();
}
