class Car{
    RevoluteJoint engine1;
    RevoluteJoint engine2;
    
    Particle tire1;
    Particle tire2;
    Box bodywork;
    
    Car(float _x, float _y){
      this.bodywork = new Box(_x, _y, 200, 25);
      this.tire1 = new Particle(_x - 75, _y, 40);
      this.tire2 = new Particle(_x + 75, _y, 40);
      
      RevoluteJointDef rjd1 = new RevoluteJointDef();
      
      rjd1.initialize(this.bodywork.body, this.tire1.body, this.tire1.body.getWorldCenter());
     
      rjd1.motorSpeed = -PI*8;       // how fast?
      rjd1.maxMotorTorque = 16000.0; // how powerful?
      rjd1.enableMotor = false;      // is it on?
      
      RevoluteJointDef rjd2 = new RevoluteJointDef();
      
      rjd2.initialize(this.bodywork.body, this.tire2.body, this.tire2.body.getWorldCenter());
     
      rjd2.motorSpeed = -PI*8;       // how fast?
      rjd2.maxMotorTorque = 16000.0; // how powerful?
      rjd2.enableMotor = false;      // is it on?
      
      this.engine1 = (RevoluteJoint) box2d.createJoint(rjd1);
      this.engine2 = (RevoluteJoint) box2d.createJoint(rjd2);
    }
    
    void controlMotor(){
      this.engine1.enableMotor(!this.engine1.isMotorEnabled());
      this.engine2.enableMotor(!this.engine2.isMotorEnabled());
  }
    
    void show(){
      this.bodywork.show();
      this.tire1.show();
      this.tire2.show();
      
      Vec2 J1 = box2d.coordWorldToPixels(this.tire1.body.getWorldCenter());
      Vec2 J2 = box2d.coordWorldToPixels(this.tire2.body.getWorldCenter());
      
      stroke(0);
      strokeWeight(5);
      point(J1.x, J1.y);
      point(J2.x, J2.y);
    }
}  
