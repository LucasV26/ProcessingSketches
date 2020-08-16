class Chaser{
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Chaser(){
    this.position = new PVector(random(0, width), random(0, height));
    this.velocity = new PVector(0.5, 1);
    this.acceleration = new PVector(0, 0);
  }
  
  void update(float sX, float sY){
    PVector star = new PVector(sX, sY);
    star.sub(this.position);
    this.acceleration = star;
    this.acceleration.setMag(0.1);
    this.velocity.add(this.acceleration);
    this.velocity.limit(5);
    this.position.add(this.velocity);
  }
  
  void display(){
    ellipse(this.position.x, this.position.y, 30, 30);
  }
  
  void borders(){
    /*
    if(this.position.x > width && this.velocity.x > 0) this.velocity.x *= -1;
    
    if(this.position.x < 0 && this.velocity.x < 0) this.velocity.x *= -1;
                                                                             //Código para kikar nas paredes ;-;
    if(this.position.y > height && this.velocity.y > 0) this.velocity.y *= -1;
    
    if(this.position.y < 0 && this.velocity.y < 0) this.velocity.y *= -1;
    */
    
    if(this.position.x > width) this.position.x = 0;
    
    if(this.position.x < 0) this.position.x = width;
                                                     //Código para atravessar as bordas ;-;
    if(this.position.y > height) this.position.y = 0;
    
    if(this.position.y < 0) this.position.y = height;
    
  }
}
