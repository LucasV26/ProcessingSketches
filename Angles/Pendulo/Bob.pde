class Bob{
  PVector position;
  PVector origin;
  float radius;
  float arm;
  float damp;
  float angle;
  float angle_V;
  float angle_A;
  float G;
  boolean drag;
  
  Bob(float _Ox, float _Oy, float _Al, float _radius, float init_A){
    this.origin = new PVector(_Ox, _Oy);
    this.arm = _Al;
    this.radius = _radius;
    this.damp = 0.995;
    this.G = -0.4;
    this.angle = init_A;
    this.angle_V = 0;
    this.angle_A = 0;
    this.drag = false;
    this.position = new PVector(this.arm * sin(this.angle), this.arm * cos(this.angle));
    this.position.add(this.origin);
  }
  
  boolean contains(float X, float Y){
    PVector point = new PVector(X, Y);
    return (PVector.dist(point, position) <= radius);
  }
  
  void releasing(){
    if(this.drag){
      this.angle_V = 0;
      this.drag = false;
    }
  }
  
  void new_or(PVector other_pos){
    this.origin = other_pos;
  }
  
  void clicking(){
    this.drag = true;
  }
  
  void dragging(float X, float Y){
    if(this.drag){
      PVector diff = PVector.sub(this.origin, new PVector(X, Y));
      this.angle = (float) Math.atan2(-1 * diff.y, diff.x) - PI/2;
    }
  }
  
  void update(){
    if(!this.drag){
      this.angle_A = this.G / this.arm * sin(this.angle);
      this.angle_V += this.angle_A;
      this.angle += this.angle_V;
      this.angle_V *= this.damp;
    }
  }
  
  void display(){
    this.position = new PVector(this.arm * sin(this.angle), this.arm * cos(this.angle));
    this.position.add(this.origin);
    fill(255);
    if(this.drag){
      fill(0, 0, 255);
    }
    ellipse(this.position.x, this.position.y, this.radius * 2, this.radius * 2);
    line(this.position.x, this.position.y, this.origin.x, this.origin.y);
  }
  
}
