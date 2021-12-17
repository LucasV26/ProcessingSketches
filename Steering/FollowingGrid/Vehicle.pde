class Vehicle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxSpeed;
  float maxFollowForce;
  float maxSpreadForce;
  
  Vehicle(float x, float y) {
    this.position = new PVector(x, y);
    this.velocity = new PVector(0, 0);
    this.acceleration = new PVector(0, 0);
    
    this.r = 2;
    
    this.maxSpeed = 5;
    this.maxFollowForce = 0.3;
    this.maxSpreadForce = 0.5;
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
  
  void folow(Grid directions) {
    PVector desire = directions.lookUp(this.position);
    desire.setMag(this.maxSpeed);
    
    PVector steer = PVector.sub(desire, this.velocity);
    steer.limit(this.maxFollowForce);
    
    this.applyForce(steer);
  }
  
  void spread(Vehicle other) {
    PVector unwanted = PVector.sub(other.position, this.position);
    float distance = unwanted.mag();
    
    if(distance <= this.r * 10){
      unwanted.setMag(-this.maxSpeed);
      
      PVector steer = PVector.sub(unwanted, this.velocity);
      steer.limit(this.maxSpreadForce);
      
      this.applyForce(steer);
    }
  }
  
  void borders() {
    if(this.position.x < -this.r) this.position.x = width + this.r;
    if(this.position.x > width + this.r) this.position.x = -this.r;
    if(this.position.y < -this.r) this.position.y = height + this.r;
    if(this.position.y > height + this.r) this.position.y = -this.r;
  }
  
  void display() {
    pushMatrix();
    fill(255);
    stroke(150, 0, 255);
    strokeWeight(1);
    
    translate(this.position.x, this.position.y);
    rotate(this.velocity.heading() + PI/2);
    
    beginShape();
    vertex(0, -this.r*2);
    vertex(this.r, this.r*2);
    vertex(-this.r, this.r*2);
    endShape(CLOSE);
    
    popMatrix();
  }
  
  void run(Grid directions) {
    this.folow(directions);
    this.borders();
    this.update();
    this.display();
  }
}
