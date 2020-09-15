class Spring{
  MouseJoint string;
  
  Spring(){
    this.string = null;
  }
  
  void createJoint(float _x, float _y, Box b){
    MouseJointDef mjd = new MouseJointDef();
    
    mjd.bodyA = box2d.getGroundBody();
    mjd.bodyB = b.body;
    
    Vec2 mouseTarget = box2d.coordPixelsToWorld(_x, _y);
    
    mjd.target.set(mouseTarget);
    
    // Configurações físicas sobre o elástico
    mjd.maxForce = 1000.0 * b.body.m_mass;
    mjd.frequencyHz = 50.0;
    mjd.dampingRatio = 0.9;
    
    this.string = (MouseJoint) box2d.createJoint(mjd);
  }
  
  void destroyJoint(){
    if(this.string != null){
      box2d.world.destroyJoint(this.string);
      this.string = null;
    }
  }
  
  void update(float _x, float _y){
    if(this.string != null){
      Vec2 mouseWorld = box2d.coordPixelsToWorld(_x, _y);
      this.string.setTarget(mouseWorld);
    }
  }
  
  void show(){
    if(this.string != null){
      // Criando vetores zerados...
      Vec2 v1 = new Vec2(0, 0);
      Vec2 v2 = new Vec2(0, 0);
      // Ancorando esses vetores com as posições de cada corpo da ligação
      this.string.getAnchorA(v1);
      this.string.getAnchorB(v2);
      // Convertendo de mundo para pixels
      v1 = box2d.coordWorldToPixels(v1);
      v2 = box2d.coordWorldToPixels(v2);
      
      stroke(255);
      line(v1.x, v1.y, v2.x, v2.y);
    }
  }
}
