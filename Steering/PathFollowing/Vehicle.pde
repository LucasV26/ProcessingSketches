class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;

  
  Vehicle(float x, float y) {
    this.position = new PVector(x, y);
    this.acceleration = new PVector(0, 0);
    
    this.r = 6;
    
    this.maxForce = 0.1;
    this.maxSpeed = 6;
    
    this.velocity = new PVector(this.maxSpeed, 0);
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    
    this.position.add(this.velocity);
    
    this.acceleration.mult(0);
  }
  
  void seek(PVector target) {
    PVector desire = PVector.sub(target, this.position);
    
    desire.setMag(this.maxSpeed);
    
    PVector steer = PVector.sub(desire, this.velocity);
    steer.limit(this.maxForce);
    
    this.applyForce(steer);
  }
  
  void follow(Path p) {
    PVector predict = this.velocity.copy();
    predict.setMag(50);
    PVector predictLoc = PVector.add(this.position, predict);
    
    PVector a = p.begin;
    PVector b = p.end;
    
    PVector target = this.getNormal(predictLoc, a, b);
    float distance = PVector.dist(predictLoc, target);
    
    PVector dir = PVector.sub(b, a);
    dir.setMag(10);
    target.add(dir);
      
    if(distance > p.r){ 
      this.seek(target);
    }
    
    if (debug) {
      fill(255);
      stroke(255);
      line(position.x, position.y, predictLoc.x, predictLoc.y);
      ellipse(predictLoc.x, predictLoc.y, 4, 4);

      // Draw normal position
      fill(255);
      stroke(255);
      line(predictLoc.x, predictLoc.y, target.x, target.y);
      ellipse(target.x, target.y, 4, 4);
      stroke(255);
      if (distance > p.r) fill(255, 0, 0);
      noStroke();
      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
    }
  }
  
  void borders() {
    if(this.position.x < -this.r) this.position.x = width + this.r;
    if(this.position.x > width + this.r) this.position.x = -this.r;
    if(this.position.y < -this.r) this.position.y = height + this.r;
    if(this.position.y > height + this.r) this.position.y = -this.r;
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }
  
  void display() {
    float theta = this.velocity.heading() - (PI/2);
    fill(255);
    stroke(255, 0, 0);
    strokeWeight(1);
    
    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(theta);
    beginShape();
    vertex(0, this.r);
    vertex(-this.r, -this.r);
    vertex(this.r, -this.r);
    endShape(CLOSE);
    popMatrix();
  }
  
  PVector getNormal(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    
    PVector normal = PVector.add(a, ab);
    
    return normal;
  }
  
  void run(Path p) {
    this.follow(p);
    this.update();
    this.borders();
    this.display();
  }
}
