class Box{
  float w;
  float h;
  
  Body body;
  
  Box(float _x, float _y){
    this.w = random(10, 50);
    this.h = random(10, 50);
    
    makeBody(new Vec2(_x, _y));
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
  
  void suicide(){
    box2d.destroyBody(this.body);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float a = this.body.getAngle();
    
    pushMatrix();
      stroke(255);
      translate(pos.x, pos.y);
      rotate(-a);
      rect(0, 0, this.w, this.h);
    popMatrix();
  }
}
