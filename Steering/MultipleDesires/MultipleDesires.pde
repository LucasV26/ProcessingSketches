ArrayList<Vehicle> vs;
final int NUM_VEHICLES = 1000;

void setup() {
  size(1200, 800);
  vs = new ArrayList<Vehicle>();
  
  for(int i = 0; i < NUM_VEHICLES; i++)
    vs.add(new Vehicle(random(0, width), random(0, height)));
}

void draw() {
  background(0);
  PVector mousePos = new PVector(mouseX, mouseY);
  
  for(int i = 0; i < vs.size(); i++){
    Vehicle v = vs.get(i);
    for(int j = 0; j < vs.size(); j++) {
      if(i != j){
        Vehicle other = vs.get(j);
        v.spread(other);
      }
    }
    v.arrive(mousePos);
    v.redirect();
    v.update();
    v.display();
  }
  
  fill(255, 100);
  ellipse(mousePos.x, mousePos.y, 100, 100);
}
