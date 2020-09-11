class Particle{
  Body body;
  float radius;
  
  Particle(float _x, float _y, float _r){
    this.radius = _r;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));
    this.body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(_r);
    
    this.body.createFixture(cs, 1);
    
    body.setLinearVelocity(new Vec2(random(-5, 5), random(-2, 0)));
    body.setAngularVelocity(random(-5, 5));
  }
  
  void suicide(){
    box2d.destroyBody(this.body);
  }
  
  boolean isDone(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    
    if(pos.x < 0 || pos.x > width || pos.y > height){
      this.suicide();
      return true;
    }
    return false;
  }
  
  
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float a = this.body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-a);
      fill(255);
      stroke(255, 0, 0);
      strokeWeight(1);
      ellipse(0, 0, this.radius*2, this.radius*2);
      stroke(0);
      strokeWeight(2);
      line(0, 0, this.radius, 0);
    popMatrix();
  }
}
