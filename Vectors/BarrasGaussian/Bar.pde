class Bar{
  float X;
  float Y = height;
  
  Bar(float X){
    this.X = X;
  }
  
  void Grow(){
    this.Y -= 5;
  }
  
  void Display(){
    point(this.X, this.Y);
  }
}
