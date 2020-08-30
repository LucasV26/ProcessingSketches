class Meio{
  //Posição
  float x;
  float y;
  float w;
  float h;
  //Coeficiente de resistência
  float c;
  
  Meio(float x_, float y_, float w_, float h_, float c_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
    this.c = c_;
  }
  
  boolean contains(Force object){
    PVector position = object.position;
    if(position.x > this.x && position.y > this.y && position.x < this.w && position.y < this.h){
      return true;
    }
    return false;
  }
  
  PVector drag(Force object){
    PVector dragForce = object.velocity.copy();
    float speed = object.velocity.magSq();
    
    dragForce.setMag(this.c * speed);
    return dragForce;
  }
  
  void show(){
    rect(this.x, this.y, this.w, this.h);
  }

}
