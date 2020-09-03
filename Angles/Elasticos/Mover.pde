class Mover{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  int R, B;
  
  Mover(float _x, float _y, float _m){
    this.position = new PVector(_x, _y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    this.R = (int) random(0, 255);
    this.B = (int) random(0, 255);
    this.mass = _m;
  }
  
  boolean contains(float _x, float _y){
    PVector point = new PVector(_x, _y);
    return (PVector.dist(this.position, point) <= this.mass);
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
  }
  
  void show(){
    noFill();
    stroke(this.R, 255, this.B);
    if(this.contains(mouseX, mouseY)) fill(this.R, 255, this.B, 100);
    ellipse(this.position.x, this.position.y, this.mass*2, this.mass*2);
  }
}
