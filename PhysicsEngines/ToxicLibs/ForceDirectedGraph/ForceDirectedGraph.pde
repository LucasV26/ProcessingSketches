import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D world;

Cluster c;

boolean showPoints = true, showLines = false;

void setup(){
  fullScreen();
  smooth();
  frameRate(30);
  background(0);
  
  world = new VerletPhysics2D();
  world.setWorldBounds(new Rect(10,10,width-20,height-20));
  //world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  c = new Cluster((int) random(3, 10), new Vec2D(width/2, height/2), random(400, 500));
  
  for(Particle p : c.particles){
    world.addParticle(p);
  }
  
  for(VerletSpring2D vs2d: c.springs){
    world.addSpring(vs2d);
  }
}

void keyPressed() {
  if (key == 'p') {
    showPoints = !showPoints;
  }
  if (key == 'l') {
    showLines = !showLines;
  }
  if(key == 'n'){
    setup();
  }
}

void draw(){
  background(0);
  
  world.update();
  
  c.show();
  
  fill(255);
  text("'P' To show/hide the points\n'L' To show/hide the lines\n'N' To create a new cloth", width-250, 20);
}
