Chaser[] bolas;

void setup(){
  size(800, 600);
  //fullScreen();
  bolas = new Chaser[10];
  for(int i=0; i < bolas.length; i++){
    bolas[i] = new Chaser();
  }

}

void draw(){
  float sX = mouseX;
  float sY = mouseY;
  background(0);
  noFill();
  
  for(Chaser b : bolas){
    b.update(sX, sY);
    stroke(255, 0, 0);
    b.display();
  }
  stroke(255, 255, 0);
  ellipse(sX, sY, 50, 50);
  //bola.update();
  ////bola.borders();
  //bola.display();
}
