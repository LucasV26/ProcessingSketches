class Rock extends Particle{
  float floor;
  float angle;
  float direction;
  
  Rock(float _x, float _y, float _m, float _bs, PImage _p){
    super(_x, _bs, _m, _p);
    this.floor = _y;
    this.lifeSpan = _y + _bs;  
    this.angle = 0;
    this.direction = (random(1) > 0.5) ? 1 : -1;
  }
  
  @Override
  void update(){
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.acceleration.mult(0);
    this.lifeSpan = this.floor - this.position.y - this.mass;
    this.angle += this.direction * (0.5 / this.mass);
  }
  
  @Override
  void show(){
    stroke(255);
    line(this.position.x - this.mass, this.floor, this.position.x + this.mass, this.floor);
    fill(255, 80, 0);
    stroke(255, 50, 0);
    pushMatrix();
    translate(this.position.x, this.position.y);
    rotate(this.angle);
    image(this.photo, 0, 0, this.mass*2, this.mass*2);
    popMatrix();
  }
}
