class Bola{
  float X;
  float Y;
  float Xmax;
  float Ymax;
  float G = 1;
  float Vy = 0;
  float Vx = 0;
  boolean bounceY = false;
  boolean bounceX = false;
  
  private Bola(float X, float Y, float Xmax, float Ymax){
    this.X = X;
    this.Y = Y;
    this.Xmax = Xmax;
    this.Ymax = Ymax;
  }
  
  private void acelerarBolaY(){
    if(this.bounceY){
      this.Vy -= this.G;
    }else{
      this.Vy += this.G;
    }
    
    if(this.Y >= this.Ymax){
      this.bounceY = true;
      if(this.Vy > 0){
        this.Vy *= -1;
      }
    }else{
      this.bounceY = false;
    }
    
    if(this.Y <= 0){
      this.bounceY = false;
      if(this.Vy < 0){
        this.Vy *= -1;
      }
    }
  }
  
  private void acelerarBolaX(){
    if(this.bounceX){
      this.Vx -= this.G;
    }else{
      this.Vx += this.G;
    }
    
    
    if(this.X >= this.Xmax){
      this.bounceX = true;
      if(this.Vx > 0){
        this.Vx *= -1;
      }
    }else{
      this.bounceX = false;
    }
    
    
    if(this.X <= 0){
      this.bounceX = false;
      if(this.Vx < 0){
        this.Vx *= -1;
      }
    }
  }
  
  private void desenharBola(){
    ellipse(this.X, this.Y, 10, 10);
    this.Y += this.Vy;
    this.X += this.Vx;
    
    this.acelerarBolaY();
    this.acelerarBolaX();
  }
  
}
