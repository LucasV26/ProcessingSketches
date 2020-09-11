class Particle{
  Body body;
  float radius;
  
  Particle(float _x, float _y, float _r){
    this.radius = _r;
    
    this.makeBody(new Vec2(_x, _y));
  }
  
  void makeBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.type = BodyType.DYNAMIC;
    
    this.body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(this.radius);
    
    this.body.createFixture(cs, 1);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float a = this.body.getAngle();
    
    pushMatrix();
      fill(255);
      stroke(255, 0, 0);
      translate(pos.x, pos.y);
      rotate(-a);
      ellipse(0, 0, this.radius*2, this.radius*2);
      stroke(0);
      line(0, 0, 0, this.radius);
    popMatrix();
  }
}
