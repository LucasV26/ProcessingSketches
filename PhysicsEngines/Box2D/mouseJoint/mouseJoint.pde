import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Box b;

Spring s;

void setup() {
  size(1200, 800);
  background(0);
  rectMode(CENTER);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  b = new Box(width/2, height/2);
  
  s = new Spring();
}

void draw() {
  background(0);
  
  box2d.step();
  
  b.show();
  
  s.update(mouseX, mouseY);
  
  s.show();
  
  fill(255);
  if(mouseX > 10 && mouseX < 70 && mouseY > 20 && mouseY < 40)
    fill(0, 255, 0);
  rect(40, 30, 60, 20);
  fill(0);
  text("Restart", 20, 35);
}

void mousePressed(){
  if(b.contains(mouseX, mouseY)){
    s.createJoint(mouseX, mouseY, b);
  }
  
  if(mouseX > 10 && mouseX < 70 && mouseY > 20 && mouseY < 40)
    setup();
}

void mouseReleased(){
  s.destroyJoint();
}
