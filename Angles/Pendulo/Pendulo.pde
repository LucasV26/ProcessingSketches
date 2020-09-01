Bob[] eles;
void setup(){
  fullScreen();
  eles = new Bob[100];
  for(int i=0; i<eles.length; i++){
    eles[i] = new Bob(width/2, 0, 10 * (i+1), 25, PI/2);
  }
}

void draw(){
  background(0);
  stroke(255, 0, 0);
  for(Bob b : eles){
    b.display();
    b.update();
  }
}

void mousePressed(){
  for(Bob b : eles){
    if(b.contains(mouseX, mouseY)){
      b.clicking();  
    }
  }
}

void mouseReleased(){
  for(Bob b : eles){
    b.releasing();
  }
}

void mouseDragged(){
  for(Bob b : eles){
    b.dragging(mouseX, mouseY);
  }
}
