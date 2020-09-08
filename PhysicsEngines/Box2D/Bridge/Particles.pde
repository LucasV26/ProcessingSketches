class Particles{
  Body body;
  float r;
  
  Particles(float _x, float _y, boolean _f){
    this.r = 8;
    
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
    
    ellipse(pos.x, pos.y, this.r*2, this.r*2);
  }
}
