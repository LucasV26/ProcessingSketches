import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D world;
Vec2D mousePos;
ArrayList<Particle> particles;
Attractor sun;
AttractionBehavior2D mouse;
final int NUM_PARTICLES = 1000;

void setup() {
  fullScreen();
  background(0);
  
  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.15f)));
  
  //Para fazer com que as bolas não saiam pulando por aí ou fiquem atoladas uma na outra
  //O mundo precisa de resistência do ar
  world.setDrag(0.05f);
  world.setWorldBounds(new Rect(0, 0, width, height));
  particles = new ArrayList<Particle>();
  
  //All in one style
  for(int i = 0; i < NUM_PARTICLES; i++){
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  }
  //sun = new Attractor(new Vec2D(width/2, height/2), 300);
  //sun.lock();
}

void draw() {
  background(0);
  world.update();
  
  //Waterfall style
  //if(particles.size() <= NUM_PARTICLES) {
  //  particles.add(new Particle(new Vec2D(width/2 + random(-50, 50), 50)));
  //}
  
  for(Particle p : particles) {
    p.show();
  }
  
  //sun.show();
  
}

void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  
  mouse = new AttractionBehavior2D(mousePos, 250, 0.9f);
  world.addBehavior(mouse);
}

void mouseDragged() {
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  world.removeBehavior(mouse);
}
