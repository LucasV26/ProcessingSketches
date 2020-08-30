class Attractor{
  PVector position;
  float G;
  float mass;
  
  Attractor(float _x, float _y, float _g, float _mass){
    this.position = new PVector(_x, _y);
    this.G = _g;
    this.mass = _mass;
  }
  
  void move(PVector m){
    this.position.add(m);
  }
  
  PVector attract(Force f){
    PVector att = PVector.sub(this.position, f.position);
    float dist = att.magSq();
    dist = constrain(dist, 10, 500);
    float strength = (this.G * this.mass * f.mass) / dist;
    att.setMag(strength);
    return att;
  }
  
  void show(){
    ellipse(this.position.x, this.position.y, this.mass*2, this.mass*2);
  }
}
