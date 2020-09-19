class Box {
  float w;
  float h;
  Body body;

  Box(float _x, float _y) {
    this.w = random(30, 90);
    this.h = random(30, 90);

    this.createBody(new Vec2(_x, _y));
  }

  void createBody(Vec2 center) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.type = BodyType.DYNAMIC;

    this.body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(this.w/2);
    float b2dH = box2d.scalarPixelsToWorld(this.h/2);
    ps.setAsBox(b2dW, b2dH); 
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    fd.density = 0.7;
    fd.friction = 0.3;
    fd.restitution = 1;
    
    this.body.createFixture(fd);
    
    this.body.setLinearVelocity(new Vec2(random(-5, 5), random(-5, 0)));
    this.body.setAngularVelocity(random(-5, 5));
  }
  
  boolean contains(float _x, float _y){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    
    return (_x > pos.x - this.w/2 && _x < pos.x + this.w/2 && _y > pos.y - this.h/2 && _y < pos.y + this.h/2);
  }
  
  void show(){
    Vec2 pos = box2d.getBodyPixelCoord(this.body);
    float angle = this.body.getAngle();
    
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(-angle);
      noFill();
      stroke(255, 80);
      if(this.contains(mouseX, mouseY)) stroke(0, 255, 0);
      rect(0, 0, this.w, this.h);
    popMatrix();
  }
}
