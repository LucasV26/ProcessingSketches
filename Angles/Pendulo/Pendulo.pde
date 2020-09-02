Bob[] eles;
void setup(){
  fullScreen();
  eles = new Bob[12];
  for(int i=0; i<eles.length; i++){
    if(i == 0){
      eles[i] = new Bob(width/2, 0, 100, 20, PI/2);
    }else{
      eles[i] = new Bob(eles[i-1].position.x, eles[i-1].position.y, 90, 20, i%2==0 ? PI/2 : 0);
    }
  }
}

void draw(){
  background(0);
  stroke(255, 0, 0);
  for(int i=1; i<eles.length; i++){
    eles[i].new_or(eles[i-1].position);
  }
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
