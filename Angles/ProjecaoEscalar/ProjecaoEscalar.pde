PVector a, b;

void setup() {
  size(1200, 600);
  background(0);
  
  a = new PVector(random(40, 300), random(0, height));
  b = new PVector(random(500, 700) + a.x, random(0, height));
}

void draw() {
  background(0);
  
  
  PVector mouse = new PVector(constrain(mouseX, a.x, b.x), mouseY);
  
  fill(255);
  stroke(255, 0, 0);
  
  ellipse(a.x, a.y, 10, 10);
  ellipse(b.x, b.y, 10, 10);
  
  line(a.x, a.y, mouse.x, mouse.y);
  line(a.x, a.y, b.x, b.y);
  ellipse(mouse.x, mouse.y, 10, 10);
  
  PVector pontoNormal = projecaoEscalar(mouse, a, b);
  
  stroke(0, 0, 255);
  line(mouse.x, mouse.y, pontoNormal.x, pontoNormal.y);
  ellipse(pontoNormal.x, pontoNormal.y, 10, 10);
}

void mouseClicked() {
  a = new PVector(random(40, 300), random(0, height));
  b = new PVector(random(500, 700) + a.x, random(0, height));
}

PVector projecaoEscalar(PVector p, PVector a, PVector b) {
  PVector apVec = PVector.sub(p, a);
  PVector abVec = PVector.sub(b, a);
  abVec.normalize(); //Transformando a linha A-B em uma linha normal
  abVec.mult(apVec.dot(abVec)); //Escalando a linha A-B com o produto do ponto
  
  PVector normal = PVector.add(a, abVec);
  return normal;
}
