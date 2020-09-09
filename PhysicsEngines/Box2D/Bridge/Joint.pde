class Joint{
  float len;
  DistanceJoint spring; // Variável da DistanceJoint
  
  Joint(Particle p1, Particle p2){
    this.len = p1.r*2;
    
    // DistanceJoint's precisam de definição de corpo A, corpo B e comprimento 
    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = p1.body;
    djd.bodyB = p2.body;
    djd.length = box2d.scalarPixelsToWorld(this.len);
    
    // Também pode ser configurado a frequência e amortecimento
    djd.frequencyHz = 0;
    djd.dampingRatio = 0;
    
    spring = (DistanceJoint) box2d.world.createJoint(djd); // Cria-se um Joint e converte o mesmo para um Distance Joint
  }
  
  void show(){
    Vec2 pos1 = box2d.getBodyPixelCoord(spring.getBodyA());
    Vec2 pos2 = box2d.getBodyPixelCoord(spring.getBodyB());
    
    stroke(0);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
  }
}
