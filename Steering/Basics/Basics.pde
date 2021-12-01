ArrayList<Vehicle> vs;
final int NUM_VEHICLES = 100;
float xnoise = 0;
float ynoise = -1;

void setup() {
  size(1200, 800);
  vs = new ArrayList<Vehicle>();
  
  for(int i = 0; i < NUM_VEHICLES; i++) {
    vs.add(new Vehicle(random(0, width), random(0, height)));
  }
}

void draw() {
  background(0);
 // PVector mousePos = new PVector(mouseX, mouseY);
  float nX = map(noise(xnoise), 0, 1, 0, width);
  float nY = map(noise(ynoise), 0, 1, 0, height);
  PVector noisePos = new PVector(nX, nY);
  
  for(Vehicle v : vs){
    v.seek(noisePos);
    v.update();
    v.display();
  }
  
  fill(255, 100);
  ellipse(noisePos.x, noisePos.y, 30, 30);
  
  //fill(125, 100);
  //ellipse(mousePos.x, mousePos.y, 30, 30);
  
  xnoise += 0.005;
  ynoise += -0.007;
}
