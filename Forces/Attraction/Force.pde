class Force{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  int R, B;
  
  Force(float m){
    this.position = new PVector(random(0, width), random(0, height));
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
  
  void attract(Force other){
    PVector att = PVector.sub(other.position, this.position); //Atrair
    //PVector att = PVector.sub(this.position, other.position); //Repelir
    float dist = att.magSq();
    dist = constrain(dist, 10, 500);
    float strength = (this.mass * other.mass) / dist;
    att.setMag(strength);
    applyForce(att);
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
    //stroke(this.R, 255, this.B);
    stroke(255, 100);
    point(this.position.x, this.position.y); //Desenhar pontos para funcionamento de sistemas de partículas
    //ellipse(this.position.x, this.position.y, this.mass*2, this.mass*2);
  }
}
