class Attractor{
  Body body;
  float radius;
  float G;
  
  Attractor(float _x, float _y, float _r, float _g){
    radius = _r;
    G = _g;
    
    createBody(box2d.coordPixelsToWorld(new Vec2(_x, _y)));
    body.setUserData(this);
  }
  
  void createBody(Vec2 center){
    BodyDef bd = new BodyDef();
    bd.position = center;
    bd.type = BodyType.STATIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(radius/2);
    
    body.createFixture(cs, 1);
  }
  
  Vec2 attract(Mover m){
    Vec2 Pos = body.getWorldCenter();
    Vec2 moverPos = m.body.getWorldCenter();
    
    Vec2 force = Pos.sub(moverPos);
    float distance = force.length();
    
    force.normalize();
    float strength = (G * radius * m.radius) / (distance * distance);
    force.mulLocal(strength);
    
    return force;
  }
  
  void grow(){
    radius += 5;
    
    //CircleShape cs = new CircleShape();
    //cs.m_radius = box2d.scalarPixelsToWorld(radius/2);
    
    //body.createFixture(cs, 1);
  }
  
  void show(){
    Vec2 position = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();
    
    pushMatrix();
      translate(position.x, position.y);
      rotate(-angle);
      noFill();
      stroke(255, 255, 0);
      ellipse(0, 0, radius, radius);      
    popMatrix();
  }
}
