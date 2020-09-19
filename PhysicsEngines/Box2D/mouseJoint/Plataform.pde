class Plataform{
  float w;
  float h;
  float a;
  
  Body body;
  
  Plataform(float _x, float _y, float _w, float _h, float _a){
    this.w = _w;
    this.h = _h;
    this.a = _a;
    
    makeBody(box2d.coordPixelsToWorld(new Vec2(_x, _y)));
  }
  
  void makeBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.position.set(center);
    bd.type = BodyType.STATIC;
    bd.setAngle(this.a);
    
    this.body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(this.w/2);
    float b2dH = box2d.scalarPixelsToWorld(this.h/2);
    ps.setAsBox(b2dW, b2dH);  
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.restitution = 1;
    fd.friction = 0.7;
    
    this.body.createFixture(fd);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-this.a);
      fill(0, 0, 100);
      stroke(0, 0, 255);
      rect(0, 0, this.w, this.h);
    popMatrix();
  }
}
