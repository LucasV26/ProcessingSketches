import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D world;

Cluster c;

void setup(){
  fullScreen();
  smooth();
  frameRate(30);
  background(0);
  
  world = new VerletPhysics2D();
  world.setWorldBounds(new Rect(10,10,width-20,height-20));
  world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  c = new Cluster((int) random(3, 8), new Vec2D(width/2, height/2), random(50, 200));
  
  for(Particle p : c.particles){
    world.addParticle(p);
  }
  
  for(VerletSpring2D vs2d: c.springs){
    world.addSpring(vs2d);
  }
}

void draw(){
  background(0);
  
  world.update();
  
  c.show();
}

void mousePressed(){
  setup();
}
