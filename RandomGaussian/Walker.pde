import java.util.Random;

Random gen = new Random();

class Walker{
  float X;
  float Y;
  String lastMove;
  
  Walker(){
    this.X = 300/*width*/;
    this.Y = 300/*height*/;
  }
  
  void display(){
    point(this.X, this.Y);
  }
  
  void step(){
    float rand = (float) gen.nextGaussian();
    float rand2 = (float) gen.nextGaussian();
    float randx = rand * rand;
    float randy = rand2 * rand2;
    
    randx -= 1;
    randy -= 1;
    
    this.X += randx;
    this.Y += randy;
  }
}
