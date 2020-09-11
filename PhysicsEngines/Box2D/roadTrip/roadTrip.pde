import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Terrain t;

Car c;

void setup() {
  size(1000, 600);
  background(0);
  rectMode(CENTER);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  t = new Terrain();
  
  c = new Car(100, height/2);
}

void draw() {
  background(0);
  strokeWeight(1);

  box2d.step();
  
  t.show();
  
  c.show();
}

void mousePressed(){
  c.controlMotor();
}
