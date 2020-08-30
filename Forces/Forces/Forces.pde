Force[] forces;
Meio[] meios;

void setup() {
  //size(800, 600);
  fullScreen();
  
  forces = new Force[100];  
  for (int i = 0; i < forces.length; i++) {
    forces[i] = new Force((i+10) * 1.1);
  }
  
  meios = new Meio[4];
  
  meios[0] = new Meio(0, 0, width/2, height/2, 0);
  meios[1] = new Meio(width/2, 0, width, height/2, -0.01);
  meios[2] = new Meio(0, height/2, width/2, height, -0.1);
  meios[3] = new Meio(width/2, height/2, width, height, -0.9);
}

void draw() {
  background(0);
  stroke(255, 100, 0);
  line(0, height-1, width/2, height-1);
  stroke(0, 155, 255);
  line(width/2, height-1, width, height-1);
  
  stroke(255, 150, 0);
  fill(255, 250, 0, 80);
  meios[0].show();
  
  stroke(0, 100, 255);
  fill(0, 150, 255, 80);
  meios[2].show();
  
  stroke(255, 0, 255);
  fill(255, 0, 150, 80);
  meios[3].show();
  
  PVector forceG;
  PVector drag;
  for (Force f : forces) {
    
    //Gravidade sendo diretamente proporcional à massa.
    forceG = new PVector(0, 0.3);
    forceG.mult(f.mass);
    f.applyForce(forceG);
    
    //Aplicando 'resistência' dos meios proporcional ao quadrado da velocidade
    for(Meio m : meios){
      if(m.contains(f)){
        drag = m.drag(f);
        f.applyForce(drag);
      }
    }
    
    f.borders();
    f.update();
    f.show();
    
    
  }

  if (mousePressed) {
    //Criando a força de atração dos corpos em direção ao mouse
    /*for (Force f : forces) {
      PVector mouseAtraction = new PVector(mouseX, mouseY);
      //mouseAtraction = PVector.sub(f.position, mouseAtraction); //Repulção
      mouseAtraction.sub(f.position); //Atração
      //mouseAtraction.mult(f.mass * 80 / (float) Math.pow(f.position.dist(new PVector(mouseX, mouseY)), 2)); //Atração baseada em distância (mais perto, mais forte)
      mouseAtraction.mult(0.05);
      f.applyForce(mouseAtraction);
    }*/
    
    //Fazendo o chão tremer
    PVector pulse;
    for (Force f : forces) {
      pulse = new PVector(0, -50);
      if(f.position.y + f.mass >= height){
        f.applyForce(pulse);
      }
    }
  }
}
