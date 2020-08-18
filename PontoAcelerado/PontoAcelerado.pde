Bola[] bolas = new Bola[100000];
int i=0;

void setup(){
  size(600, 600);
  //fullScreen();
  bolas[0] = new Bola(300, 300, width, height);
  i = 0;
}

void draw(){
  fill(255);
  background(0);
  stroke(255, 0, 0);
  for(int x=0; x <= i; x++){
    bolas[x].desenharBola();
  }
  noFill();
}

void mouseDragged(){
  bolas[i] = new Bola(mouseX, mouseY, width, height);
  i++;
}
