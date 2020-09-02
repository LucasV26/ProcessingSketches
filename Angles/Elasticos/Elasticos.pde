Mover bob;
float restL;
float k;
PVector origin;


void setup(){
  fullScreen();
  rectMode(CENTER);
  restL = 250;
  bob = new Mover(width/2, 0, 25);
  origin = new PVector(width/2, 0);
  k = 0.1;
}

void draw(){
  background(0);
  noFill();
  stroke(255);
  
  PVector G = new PVector(0, 0.3);
  G.mult(bob.mass);
  
  PVector air_drag = bob.velocity.copy();
  air_drag.setMag(-0.1 * bob.velocity.magSq());
  
  PVector wind = new PVector(3, 0);
  
  PVector spring = PVector.sub(bob.position, origin); // Calculando o tamanho atual a mola, tanto quanto a direção do vetor da força
  float stretch = spring.mag() - restL; // Distorção = cumprimento atual - cumprimento de repouso
  spring.setMag(-k * stretch); // Fórmula da força elástica
  
  if(mousePressed){
    bob.applyForce(wind);
  }
  bob.applyForce(G); 
  bob.applyForce(air_drag);
  bob.applyForce(spring);
  
  
  bob.show();
  bob.update();
  bob.borders();
  
  fill(150, 80);
  rect(origin.x, origin.y, 25, 25);
  line(bob.position.x, bob.position.y, origin.x, origin.y);
}
