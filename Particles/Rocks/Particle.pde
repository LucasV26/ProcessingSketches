class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float lifeSpan;
  float deathSpeed;
  PImage photo;
  
  Particle(float _x, float _y, float _m, PImage _p){
    this.position = new PVector(_x, _y);
    this.velocity = new PVector(random(-2, 2), random(-2, 0));
    this.acceleration = new PVector(0, 0);
    this.lifeSpan = 255;
    this.deathSpeed = 3;
    this.mass = _m;
    this.photo = _p;
  }
  
  boolean isDead(){
    return this.lifeSpan <= 0;
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f, this.mass);
    this.acceleration.add(force);
  }
  
  void update(){
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.acceleration.mult(0);
    this.lifeSpan -= this.deathSpeed;
  }
  
  void show(){
    noFill();
    stroke(255, this.lifeSpan);
    point(this.position.x, this.position.y);
  }
}
