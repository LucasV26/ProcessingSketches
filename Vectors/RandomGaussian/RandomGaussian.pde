Walker walker;

void setup(){
  size(600, 600); 
  walker = new Walker();
  background(255);
}

void draw(){
  fill(0);
  walker.display();
  walker.step();
}
