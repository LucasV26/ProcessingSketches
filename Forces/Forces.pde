Force[] forces;

void setup() {
  //size(800, 600);
  fullScreen();
  forces = new Force[20];
  for (int i = 0; i < forces.length; i++) {
    forces[i] = new Force((i + 1) * 5);
  }
}

void draw() {
  background(0);
  float c = -0.01;
  //PVector forceW = new PVector(1, 0);
  for (Force f : forces) {
    //Gravidade sendo diretamente proporcional à massa.
    PVector forceG = new PVector(0, 0.1);
    forceG.mult(f.mass);
    f.applyForce(forceG);
    //Aplicando 'resistência' do ar proporcional à massa
    PVector drag = f.velocity.copy();
    drag.setMag(c*f.mass);
    f.applyForce(drag);
    f.borders();
    f.update();
    f.show();
  }

  for (int i = 0; i < forces.length; i++) {
    stroke(255, i*10, 0);
    if (i != forces.length-1) line(forces[i].position.x, forces[i].position.y, forces[i+1].position.x, forces[i+1].position.y);
  }

  if (mousePressed) {
    //Criando a força de atração dos corpos em direção ao mouse
    for (Force f : forces) {
      PVector mouseAtraction = new PVector(mouseX, mouseY);
      //mouseAtraction = PVector.sub(f.position, mouseAtraction); //Repulção
      mouseAtraction.sub(f.position); //Atração
      mouseAtraction.mult(0.01);
      f.applyForce(mouseAtraction);
    }
  }
}
