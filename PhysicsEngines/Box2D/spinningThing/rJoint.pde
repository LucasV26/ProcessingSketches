class rJoint{
  Box b1;
  Box b2;
  Box b3;
  
  RevoluteJoint Joint1;
  RevoluteJoint Joint2;
  
  rJoint(float _x, float _y){
    this.b1 = new Box(_x, _y, width/2, 25, true);
    this.b2 = new Box(_x - width/3, _y, 250, 15, false);
    this.b3 = new Box(_x + width/3, _y, 250, 15, false);
    
    // Criando a definição da conexão
    RevoluteJointDef rjd1 = new RevoluteJointDef();
    RevoluteJointDef rjd2 = new RevoluteJointDef();
    // Inicializando a conexão com os corpos e o ponto em comum
    rjd1.initialize(this.b1.body, this.b2.body, box2d.coordPixelsToWorld(new Vec2(_x - width/3 + 80, _y)));
    
    rjd2.initialize(this.b1.body, this.b3.body, box2d.coordPixelsToWorld(new Vec2(_x + width/3 - 80, _y)));
    
    // Algumas configurações do motor da conexão
    // Turning on a motor (optional)
    rjd1.motorSpeed = PI*2;       // how fast?
    rjd1.maxMotorTorque = 8000.0; // how powerful?
    rjd1.enableMotor = true;      // is it on?
    
    // Algumas configurações do motor da conexão
    // Turning on a motor (optional)
    rjd2.motorSpeed = -PI*2;       // how fast?
    rjd2.maxMotorTorque = 8000.0; // how powerful?
    rjd2.enableMotor = true;      // is it on?
    
    // Criando a conexão no mundo (Necessário conversão mara RevoluteJoint)
    this.Joint1 = (RevoluteJoint) box2d.world.createJoint(rjd1);
    this.Joint2 = (RevoluteJoint) box2d.world.createJoint(rjd2);
  }
  
  void show(){
    fill(255);
    this.b1.show();
    this.b2.show();
    this.b3.show();
    
    Vec2 J1 = box2d.coordWorldToPixels(this.b1.body.getWorldCenter());
    J1.addLocal(new Vec2(80 - width/3, 0));
    Vec2 J2 = box2d.coordWorldToPixels(this.b1.body.getWorldCenter());
    J2.subLocal(new Vec2(80 - width/3, 0));
    
    stroke(0);
    strokeWeight(5);
    point(J1.x, J1.y);
    point(J2.x, J2.y);
  }
  
  void controlMotor(boolean M1, boolean M2){
    if(M1)
      this.Joint1.enableMotor(!this.Joint1.isMotorEnabled());
    if(M2)
      this.Joint2.enableMotor(!this.Joint2.isMotorEnabled());
  }
  
  String motorStatus(){
    String r = "Status dos Motores: "; 
    
    if(this.Joint1.isMotorEnabled()){
      r += "Motor 1: Ligado | ";
    }else{
      r += "Motor 1: Desligado | ";
    }
    
    if(this.Joint2.isMotorEnabled()){
      r += "Motor 2: Ligado.";
    }else{
      r += "Motor 2: Desligado.";
    }
    
    return r;
  }
}
