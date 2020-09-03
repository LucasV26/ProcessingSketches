class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  
  Particle(){
    this.position = new PVector(width/2, 50);
    this.velocity = new PVector(random(-1, 1), random(-1, 0));
    this.acceleration = new PVector(0, 0.05);
    this.lifeSpan = 255;
  }
  
  void update(){
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.lifeSpan -= 2;
  }
  
  void show(){
    noFill();
    stroke(255, this.lifeSpan);
    ellipse(this.position.x, this.position.y, 10, 10);
  }
}
