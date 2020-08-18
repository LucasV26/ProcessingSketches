class Force{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  int R, B;
  
  Force(float m){
    this.position = new PVector(random(0, width), 1);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.R = (int) random(0, 255);
    this.B = (int) random(0, 255);
    this.mass = m;
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f, this.mass);
    this.acceleration.add(force);
  }
  
  void update(){
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
 
  void borders(){
    if(this.position.x + this.mass > width) {
       this.position.x = width - this.mass;
       this.velocity.x *= -0.8;
    }
    if(this.position.x - this.mass < 0) { 
      this.position.x = 0 + this.mass; 
      this.velocity.x *= -0.8;
    }
    if(this.position.y + this.mass > height) {
      this.position.y = height - this.mass;
      this.velocity.y *= -0.5;
    }
    if(this.position.y - this.mass < 0) {
      this.position.y = 0 + this.mass;
      this.velocity.y *= -0.9;
    }
    if(this.position.y + this.mass == height){
      float u = -0.1; // u = coeficiente de atrito
      if(this.position.x > width/2) u = -0.01; //O chão da parte direita da tela tem atrito 10x menor
      float n = this.mass; // n = normal
      PVector atrito = this.velocity.copy();
      atrito.setMag(u * n);
      this.applyForce(atrito);
    }
  }
  
  void show(){
    noFill();
    stroke(this.R, 255, this.B);
    ellipse(this.position.x, this.position.y, this.mass*2, this.mass*2);
  }
}
