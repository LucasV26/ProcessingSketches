class Mover{
  Body body;
  float radius;
  
  Mover(float _x, float _y){
    radius = 1;
    
    createBody(box2d.coordPixelsToWorld(new Vec2(_x, _y)));
    body.setUserData(this);
  }
  
  void createBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.position = center;
    bd.type = BodyType.DYNAMIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(radius/2);
    
    body.createFixture(cs, 1);
  }
  
  void applyForce(Vec2 force){
    body.applyForceToCenter(force);
  }
  
  void suicide(){
    //box2d.destroyBody(body);
  }
  
  void show(){
    Vec2 position = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    pushMatrix();
      translate(position.x, position.y);
      rotate(-angle);
      noFill();
      stroke(255);
      point(0, 0);
      //ellipse(0, 0, radius, radius);
    popMatrix();
  }
}
