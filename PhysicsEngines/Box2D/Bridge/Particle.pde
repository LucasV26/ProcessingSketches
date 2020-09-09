class Particle{
  Body body;
  float r;
  
  Particle(float _x, float _y, float _r, boolean _f){
    this.r = _r;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(_x, _y)));
    bd.type = BodyType.DYNAMIC;
    if(_f){
      bd.type = BodyType.STATIC;  
    }
    
    this.body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(this.r);
    
    this.body.createFixture(cs, 1);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    
    stroke(255);
    fill(100);
    ellipse(pos.x, pos.y, this.r*2, this.r*2);
  }
}
