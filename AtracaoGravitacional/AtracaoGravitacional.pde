Atraction[] corpos;

void setup(){
  size(800, 600);
  corpos = new Atraction[30];
  for(int i=0; i < corpos.length; i++){
    corpos[i] = new Atraction(width/random(1, 4) + i*10*random(-1, 1), height/random(1, 4) + i*10*random(-1, 1));
  }
}

void draw(){
  background(0);
  for(Atraction c : corpos){
    for(Atraction c2 : corpos){
      c.atract(c2.position);
    }
    c.update();
    c.display();
  }
  stroke(255, 255, 0);
  ellipse(mouseX, mouseY, 50, 50);
}
