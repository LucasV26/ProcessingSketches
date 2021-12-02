void setup() {
  size(1200, 800);
}

void draw() {
  background(0);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  PVector centerPos = new PVector(width/2, height/2);
  
  PVector dist = PVector.sub(mousePos, centerPos);
  dist.setMag(200);
  
  PVector eixoX = new PVector(200, 0);
  
  drawVector(dist, centerPos, 1);
  drawVector(eixoX, centerPos, 1);
  
  //AngleBetween
  //float theta = PVector.angleBetween(dist, eixoX);

  //Dot Product
  float theta = acos(PVector.dot(dist, eixoX) / (dist.mag() * eixoX.mag()));
  
  fill(255);
  text(int(degrees(theta)) + " degrees\n" + theta + " radians", 10, 160);
  text("x: " + dist.x + "\ny: " + dist.y, 10, 210);
}

void drawVector(PVector vector, PVector position, float scale) {
  pushMatrix();
  float arrowSize = 6;
  stroke(255);
  strokeWeight(2);
  
  translate(position.x, position.y);
  rotate(vector.heading());
  
  float len = vector.mag() * scale;
  
  line(0, 0, len, 0);
  line(len, 0, len-arrowSize, arrowSize/2);
  line(len, 0, len-arrowSize, -arrowSize/2);
  popMatrix();
}
