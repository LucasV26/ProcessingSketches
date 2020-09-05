ArrayList<System> systems;
PImage rock;

void setup() {
  //size(800, 600, P2D);
  fullScreen();
  imageMode(CENTER);
  systems = new ArrayList<System>();
  rock = loadImage("Rock.png");
  systems.add(new System(width/2, 200, rock));
}

void draw() {
  background(0);
  PVector gravity = new PVector(0, 0.2);
  for(System s : systems){
    s.applyForce(gravity, true);
    s.run();
    if(random(1) < 0.01) s.addParticle();
  }
}

void mousePressed(){
  systems.add(new System(mouseX, mouseY, rock));
}
