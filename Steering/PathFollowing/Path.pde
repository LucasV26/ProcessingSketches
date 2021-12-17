class Path {
  PVector begin;
  PVector end;
  float r;
  
  Path() {
    this.begin = new PVector(0, height/2);
    this.end = new PVector(width, height/2);
    
    this.r = 20;
  }
  
  void display() {
    stroke(0, 0, 255, 100);
    strokeWeight(r*2);
    line(this.begin.x, this.begin.y, this.end.x, this.end.y);
    
    stroke(0, 0, 255);
    strokeWeight(2);
    line(this.begin.x, this.begin.y, this.end.x, this.end.y);
  }
}
