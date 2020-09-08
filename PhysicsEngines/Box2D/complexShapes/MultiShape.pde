class MultiShape{
  float w;
  float h;
  float r;
  
  Body multiB;
  
  MultiShape(float _x, float _y){
    this.w = 80;
    this.h = 15;
    this.r = 10;
    
    makeBody(new Vec2(_x, _y));
  }
  
  void makeBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.setPosition(box2d.coordPixelsToWorld(center));
    bd.type = BodyType.DYNAMIC;
    this.multiB = box2d.createBody(bd);
    
    CircleShape cs1 = new CircleShape();
    Vec2 offset = box2d.vectorPixelsToWorld(new Vec2(-this.w/3, (this.h/2 + this.r)));
    cs1.m_p.set(offset);
    cs1.m_radius = box2d.scalarPixelsToWorld(this.r);
    
    CircleShape cs2 = new CircleShape();
    offset = box2d.vectorPixelsToWorld(new Vec2(this.w/3, (this.h/2 + this.r)));
    cs2.m_p.set(offset);
    cs2.m_radius = box2d.scalarPixelsToWorld(this.r);
    
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(this.w/2);
    float b2dH = box2d.scalarPixelsToWorld(this.h/2);
    ps.setAsBox(b2dW, b2dH);
    
    this.multiB.createFixture(cs1, 1);
    this.multiB.createFixture(cs2, 1);
    this.multiB.createFixture(ps, 1);
    
    this.multiB.setLinearVelocity(new Vec2(random(-5, -5), random(-5, 0)));
    this.multiB.setAngularVelocity(random(-5, 5));
  }
  
  void suicide(){
    box2d.destroyBody(this.multiB);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.multiB);
    float a = this.multiB.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      rect(0, 0, this.w, this.h);
      ellipse(-this.w/3, this.h/2 + this.r, 2*this.r, 2*this.r);
      ellipse(this.w/3, this.h/2 + this.r, 2*this.r, 2*this.r);
    popMatrix();
  }

}
