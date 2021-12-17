ArrayList<Vehicle> vs;
Path p;
boolean debug = false;

void setup() {
  size(1200, 600);
  background(0);
  
  p = new Path();
  vs = new ArrayList<Vehicle>();
}

void draw() {
  //background(0);
  
 // p.display();
  for(Vehicle v : vs){
    v.run(p);
  }
}

void mouseDragged() {
  vs.add(new Vehicle(mouseX, mouseY));
}

void keyPressed() {
  if(key == 'd')
    debug = !debug;
}
