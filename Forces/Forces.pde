Force[] forces;
Meio agua, ar, gelatina, alcool;

void setup() {
  //size(800, 600);
  fullScreen();
  
  forces = new Force[20];  
  for (int i = 0; i < forces.length; i++) {
    forces[i] = new Force((i+1) * 10);
  }
  
  alcool = new Meio(0, 0, width/2, height/2, 0.01);
  ar = new Meio(width/2, 0, width, height/2, -0.01);
  agua = new Meio(0, height/2, width/2, height, -0.1);
  gelatina = new Meio(width/2, height/2, width, height, -1.2);
}

void draw() {
  background(0);
  
  stroke(255, 100, 0);
  line(0, height-1, width/2, height-1);
  stroke(0, 155, 255);
  line(width/2, height-1, width, height-1);
  
  stroke(255, 150, 0);
  fill(255, 250, 0, 80);
  alcool.show();
  
  stroke(0, 100, 255);
  fill(0, 150, 255, 80);
  agua.show();
  
  stroke(255, 0, 255);
  fill(255, 0, 150, 80);
  gelatina.show();
  
  PVector forceG;
  PVector drag;
  for (Force f : forces) {
    
    //Gravidade sendo diretamente proporcional à massa.
    forceG = new PVector(0, 0.3);
    forceG.mult(f.mass);
    f.applyForce(forceG);
    
    //Aplicando 'resistência' dos meios proporcional ao quadrado da velocidade
    if(alcool.contains(f)){
      drag = alcool.drag(f);
      f.applyForce(drag);
    }
    
    if(ar.contains(f)){
      drag = ar.drag(f);
      f.applyForce(drag);
    }
    
    if(agua.contains(f)){
      drag = agua.drag(f);
      f.applyForce(drag);
    }
    
    if(gelatina.contains(f)){
      drag = gelatina.drag(f);
      f.applyForce(drag);
    }
    
    f.borders();
    f.update();
    f.show();
  }

  if (mousePressed) {
    //Criando a força de atração dos corpos em direção ao mouse
    for (Force f : forces) {
      PVector mouseAtraction = new PVector(mouseX, mouseY);
      //mouseAtraction = PVector.sub(f.position, mouseAtraction); //Repulção
      mouseAtraction.sub(f.position); //Atração
      //mouseAtraction.mult(f.mass * 80 / (float) Math.pow(f.position.dist(new PVector(mouseX, mouseY)), 2)); //Atração baseada em distância (mais perto, mais forte)
      mouseAtraction.mult(0.05);
      f.applyForce(mouseAtraction);
    }
  }
}
