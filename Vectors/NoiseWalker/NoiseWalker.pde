Noise noisePoint;

void setup(){
  //size(600, 600);
  fullScreen();
  background(0);
  noisePoint = new Noise(width/2, height/2);
}

void draw(){
  noFill();
 stroke(255);
 strokeWeight(2);
 noisePoint.display();
 noisePoint.walk();
}
