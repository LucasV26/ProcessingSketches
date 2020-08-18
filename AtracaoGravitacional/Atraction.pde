class Atraction{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Atraction(float X, float Y){
    this.position = new PVector(X, Y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
  }
  
  void display(){
    noFill();
    stroke(255, 0, 0);
    ellipse(this.position.x, this.position.y, 25, 25);
  }
  
  void atract(PVector corpo){
    this.acceleration.x += 0.5*(corpo.x - this.position.x);
    this.acceleration.y += 0.5*(corpo.y - this.position.y);
  }
  
  void update(){
    PVector star = new PVector(mouseX, mouseY);
    star.sub(this.position);
    this.acceleration = star;
    this.acceleration.setMag(5);
    this.velocity.add(this.acceleration);
    this.velocity.limit(40);
    this.position.add(this.velocity);
  }
  
  
}
