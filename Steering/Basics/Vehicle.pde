class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;
  
  Vehicle(float x, float y) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.r = 6;
    this.maxspeed = random(1, 2);
    this.maxforce = random(0.01, 0.5);
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxspeed);
    
    this.position.add(this.velocity);
    
    //Necessário resetar as forças aplicadas ao corpo (não acumuláveis)
    this.acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desire = PVector.sub(target, this.position);
    
    desire.setMag(this.maxspeed);
    
    PVector steer = PVector.sub(desire, this.velocity);
    steer.limit(this.maxforce);
    
    this.applyForce(steer);
  }


  
  void display() {
    //Código para desenhar um triângulo apontando para a velocidade
    float theta = this.velocity.heading() + PI/2;
    fill(255);
    stroke(255, 0, 0);
    strokeWeight(1);
    
    //Matrix -> Mudanças aqui não aferam o resto do canvas
    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(theta);
    beginShape();
    vertex(0, -this.r*2);
    vertex(-this.r, this.r*2);
    vertex(this.r, this.r*2);
    endShape(CLOSE);
    popMatrix();
  }
}
