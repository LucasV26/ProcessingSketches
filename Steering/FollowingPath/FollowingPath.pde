Grid g;
ArrayList<Vehicle> vs;

float zoff = 0;

final int NUM_VEHICLES = 1000;

boolean showGrid = false;
boolean changeOverTime = false;
boolean paintScreen = true;

void setup() {
  fullScreen();
  background(0);
  //size(1200, 800);
  
  g = new Grid(20);
  vs = new ArrayList<Vehicle>();
  
  for(int i = 0; i < NUM_VEHICLES; i++) {
    vs.add(new Vehicle(random(0, width), random(0, height)));
  }
}

void draw() {
  if(!paintScreen)
    background(0);
  
  for(int i = 0; i < vs.size(); i++){
    Vehicle v = vs.get(i);
    
    for(int j = 0; j < vs.size(); j++){
      if(i != j){
        Vehicle other = vs.get(j);
        v.spread(other);
      }
    }
    
    v.run(g);
  }
  
  if(changeOverTime){
    g.update(zoff);
    zoff += 0.05;
  }
  
  if(showGrid)
    g.display();
    
  fill(0);
  rect(width - 200, height - 200, 200, 200);
  fill(255);
  text("'S': grid arrows: " + (showGrid ? "on" : "off"), width - 180, height - 170);
  text("'C': dynamic grid: " + (changeOverTime ? "on" : "off"), width - 180, height - 150);
  text("'P': leave marks: " + (paintScreen ? "on" : "off"), width - 180, height - 130);
  text("'N': new grid pattern", width - 180, height - 100);
}

void keyPressed() {
  if(key == 'p')
    paintScreen = !paintScreen;
  if(key == 's')
    showGrid = !showGrid;
  if(key == 'c')
    changeOverTime = !changeOverTime;
  if(key == 'n')
    g.init();
}
