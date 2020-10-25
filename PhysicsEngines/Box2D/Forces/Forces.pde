import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Attractor sun;

Mover[] movers; // Can be switched to a ArrayList

void setup(){
  size(1200, 600);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  int quant = 1000;
  
  movers = new Mover[quant];
  
  for(int i = 0; i < quant; i++){
    movers[i] = new Mover(random(width), random(height));
  }
  
  sun = new Attractor(width/2, height/2, 10, 10);
  
  background(0);
}

void draw(){
  background(0);
  
  box2d.step();
  
  //sun.show();
  
  for(Mover m : movers){
    m.show();
    
    m.applyForce(sun.attract(m));
    
    if(mousePressed){
      Vec2 wind = new Vec2(width/2 - mouseX, 0);
      m.applyForce(wind);
    }
  }
}

void beginContact(Contact cp){
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if(o1.getClass() == Attractor.class && o2.getClass() == Mover.class){
    Attractor a = (Attractor) o1;
    a.grow();
    Mover m = (Mover) o2;
    m.suicide();
  }
  
  if(o2.getClass() == Attractor.class && o1.getClass() == Mover.class){
    Attractor a = (Attractor) o2;
    a.grow();
    Mover m = (Mover) o1;
    m.suicide();
  }
}
