float y = 500;
float yspeed = -30;
float yacceleration = 1;

void setup(){
   size(600, 600);
}

void draw(){
  background(0);
  fill(255);
  ellipse(300, y, 25, 25);
  
  y += yspeed;
  if(constrain(y, 0, height) != 0){
    y = constrain(y, 0, height);
  }
  
  if(y >= height){
    if(yspeed >= 0){
      yspeed *= -1;
    }
  }
  
  yspeed += yacceleration;
}  
