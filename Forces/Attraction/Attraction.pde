Force[] forces;
Attractor[] suns;
PVector mAtual;
PVector mAnterior;
int quant;

void setup() {
  //size(800, 600);
  fullScreen();
  quant = 4;
  
  forces = new Force[10000];  
  for (int i = 0; i < forces.length; i++) {
    forces[i] = new Force(1);
  }
  
  suns = new Attractor[quant];
  
  //Sol no meio da tela
  //suns[0] = new Attractor(width/2, height/2, 1, 150);
  
  //3 sóis alternados
  //suns[0] = new Attractor(width/4, 0, 1, 150);
  //suns[1] = new Attractor(3*width/4, height/2, 1, 150);
  //suns[2] = new Attractor(width/4, height, 1, 150);
  
  //Sóis nos quatro pontos da tela
  suns[0] = new Attractor(width/4, height/4, 1, 150);
  suns[1] = new Attractor(width/4, 3*height/4, 1, 150);
  suns[2] = new Attractor(3*width/4, height/4, 1, 150);
  suns[3] = new Attractor(3*width/4, 3*height/4, 1, 150);
  background(0);
}

void draw() {
  background(0);
  noFill();
  stroke(190, 255, 0);
  PVector move = new PVector(0, 0);
  if(mousePressed){
      mAnterior = mAtual;
      mAtual = new PVector(mouseX, mouseY);
      move = PVector.sub(mAtual, mAnterior);
  }
  
  //Desenhando os sóis
  for(Attractor s : suns){
    s.show();
    s.move(move);
  }
  
  PVector attraction;
  for (Force f : forces) {
    
    //Aplicando atração em direção aos demais forces
    //for (Force f2 : forces) {
    //  if(f != f2){
    //    f.attract(f2);
    //  }
    //}
    
    //Aplicando atração em direção à um attractor
    for(Attractor s : suns){
      attraction = s.attract(f);
      f.applyForce(attraction);
    }
    
    //f.borders();
    f.update();
    f.show();
  }
}

void mousePressed(){
  mAtual = new PVector(mouseX, mouseY);
}
