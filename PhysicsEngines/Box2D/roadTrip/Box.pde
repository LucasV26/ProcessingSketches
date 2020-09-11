class Box{
  float w;
  float h;
  Body body;
  
  Box(float _x, float _y, float _w, float _h){
    this.w = _w;
    this.h = _h;
    
    this.makeBody(new Vec2(_x, _y));
  }
  
  void makeBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.type = BodyType.DYNAMIC;
    
    this.body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(this.w/2);
    float b2dH = box2d.scalarPixelsToWorld(this.h/2);
    ps.setAsBox(b2dW, b2dH);
    
    this.body.createFixture(ps, 1);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float a = this.body.getAngle();
    
    pushMatrix();
      fill(255);
      stroke(255, 0, 0);
      translate(pos.x, pos.y);
      rotate(-a);
      rect(0, 0, this.w, this.h);
    popMatrix();
  }
}  
