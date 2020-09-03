class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  
  Particle(float _x, float _y){
    this.position = new PVector(_x, _y);
    this.velocity = new PVector(random(-1, 1), random(-1, 0));
    this.acceleration = new PVector(0, 0.05);
    this.lifeSpan = 255;
  }
  
  void update(){
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.lifeSpan -= 1.5;
  }
  
  void show(){
    noFill();
    stroke(255, this.lifeSpan);
    point(this.position.x, this.position.y);
  }
}
