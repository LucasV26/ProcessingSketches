class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxSpeed;
  float maxRedirectForce;
  float maxArriveForce;
  float maxSpreadForce;
  
  Vehicle(float x, float y) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(random(-1, -2), random(1, 2));
    this.acceleration = new PVector(0, 0);
    
    this.r = 2;
    
    this.maxSpeed = 4;
    this.maxRedirectForce = 0.3;
    this.maxArriveForce = 0.01;
    this.maxSpreadForce = 0.3;
  }
  
  void update() {
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    
    this.position.add(this.velocity);
    
    this.acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    this.acceleration.add(force);
  }
  
  void arrive(PVector target) {
    PVector desire = PVector.sub(target, this.position);
    float distance = desire.mag();
    float speed = this.maxSpeed;
    
    //Desacelerando conforme se aproxima do alvo
    if(distance < 100)
      speed = map(distance, 0, 100, 0, this.maxSpeed);
    
    
    desire.setMag(speed);
    
    PVector steer = PVector.sub(desire, this.velocity);
    steer.limit(this.maxArriveForce);
    
    this.applyForce(steer);
  }
  
  void redirect() {
    if(this.position.x <= 25) {
      PVector desire = new PVector(this.maxSpeed, this.velocity.y);
      PVector steer = PVector.sub(desire, this.velocity);
      steer.limit(maxRedirectForce);
      
      this.applyForce(steer);
    }
    if(this.position.x >= width - 25) {
      PVector desire = new PVector(-this.maxSpeed, this.velocity.y);
      PVector steer = PVector.sub(desire, this.velocity);
      steer.limit(maxRedirectForce);
      
      this.applyForce(steer);
    }
    if(this.position.y <= 25) {
      PVector desire = new PVector(this.velocity.x, this.maxSpeed);
      PVector steer = PVector.sub(desire, this.velocity);
      steer.limit(maxRedirectForce);
      
      this.applyForce(steer);
    }
    if(this.position.y >= height - 25) {
      PVector desire = new PVector(this.velocity.x, -this.maxSpeed);
      PVector steer = PVector.sub(desire, this.velocity);
      steer.limit(maxRedirectForce);
      
      this.applyForce(steer);
    }
  }
  
  void spread(Vehicle other) {
    PVector unwanted = PVector.sub(other.position, this.position);
    float distance = unwanted.mag();
    
    if(distance < this.r * 10) {
      unwanted.setMag(-this.maxSpeed);
      
      PVector steer = PVector.sub(unwanted, this.velocity);
      steer.limit(this.maxSpreadForce);
      
      this.applyForce(steer);
    }
  }
  
  void display() {
    float theta = this.velocity.heading() + PI/2;
    fill(255);
    stroke(255, 0, 0);
    strokeWeight(1);
    
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
