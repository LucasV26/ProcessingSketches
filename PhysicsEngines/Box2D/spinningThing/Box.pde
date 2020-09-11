class Box{
  Body body;
  float w;
  float h;
  
  Box(float _x, float _y, float _w, float _h, boolean fixed){
    this.w = _w;
    this.h = _h;
    
    this.makeBody(new Vec2(_x, _y), fixed);
  }
  
  boolean contains(float _x, float _y){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    return(_x > pos.x - this.w/2 && _x < pos.x + this.w/2 && _y > pos.y - this.h/2 && _y < pos.y + this.h/2);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float a = this.body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      stroke(0, 0, 255);
      strokeWeight(1);
      rect(0, 0, this.w, this.h);
    popMatrix();
  }
  
  void makeBody(Vec2 center, boolean fixed){
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.type = BodyType.DYNAMIC;
    if(fixed) bd.type = BodyType.STATIC;
    
    this.body = box2d.world.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(this.w/2);
    float b2dH = box2d.scalarPixelsToWorld(this.h/2);
    ps.setAsBox(b2dW, b2dH);
    
    this.body.createFixture(ps, 1);
  }
}
