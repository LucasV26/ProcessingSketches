Mover bob;
Spring[] jennys;

void setup(){
  fullScreen();
  rectMode(CENTER);
  bob = new Mover(width/2, 0, 25);
  jennys = new Spring[8];
  
  jennys[0] = new Spring(width/2, 0, 100, 0.1);
  jennys[1] = new Spring(0, height/2, 100, 0.2);
  jennys[2] = new Spring(width, height/2, 100, 0.3);
  jennys[3] = new Spring(width/2, height, 100, 0.4);
  jennys[4] = new Spring(0, 0, 100, 0.5);
  jennys[5] = new Spring(width, 0, 100, 0.6);
  jennys[6] = new Spring(0, height, 100, 0.7);
  jennys[7] = new Spring(width, height, 100, 0.8);
}

void draw(){
  background(0);
  noFill();
  stroke(255);
  
  PVector G = new PVector(0, 0.3);
  G.mult(bob.mass);
  
  PVector air_drag = bob.velocity.copy();
  air_drag.setMag(-0.1 * bob.velocity.magSq());
  
  PVector wind = new PVector(3, 0);
  
  if(mousePressed){
    bob.applyForce(wind);
  }
  bob.applyForce(G); 
  bob.applyForce(air_drag);
  
  for(Spring j : jennys){
    j.show();
    j.drag(bob);
  }
  
  bob.show();
  bob.update();
  bob.borders();
}

void mousePressed(){
  for(Spring j : jennys){
    if(j.contains(mouseX, mouseY)){
      if(j.connected) j.disconnect();
      else
      if(!j.connected) j.connect();
    }
  }
  
  if(bob.contains(mouseX, mouseY)){
    for(Spring j : jennys){
      j.disconnect();
    }
  }
}
