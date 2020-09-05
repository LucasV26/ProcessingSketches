ArrayList<System> systems;
void setup() {
  //size(1200, 800);
  fullScreen();
  systems = new ArrayList<System>();
}

void draw() {
  background(0);

  if (systems.size() > 20) {
    systems.remove(0);
    if (systems.size() > 40) {
      systems.remove(1);
      if (systems.size() > 60) {
        systems.remove(2);
      }
    }
  }

  for (System s : systems) {
    s.addParticle();
    s.run();
  }
}

void mouseDragged() {
  systems.add(new System(mouseX, mouseY));
}
