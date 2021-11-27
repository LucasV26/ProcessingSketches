import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D world;
ArrayList<Particle> particles;
Attractor sun;

void setup() {
  fullScreen();
  background(0);
  
  world = new VerletPhysics2D();
  particles = new ArrayList<Particle>();
  sun = new Attractor(new Vec2D(width/2, height/2), 150);
  
  for(int i = 0; i < 1000; i++) {
    particles.add(new Particle(new Vec2D(random(0, width), random(0, height))));
  }
}

void draw() {
  background(0);
  world.update();
  
  sun.show();
  
  for(Particle p : particles) {
    p.show();
  }
  
}
