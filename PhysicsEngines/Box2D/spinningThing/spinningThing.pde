import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Particle> particles;

rJoint death;

void setup(){
  size(800, 600);
  background(0);
  rectMode(CENTER);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  particles = new ArrayList<Particle>();
  
  death = new rJoint(width/2, height/2);
}

void draw(){
  background(0);
  box2d.step();
  
  if(random(1) < 0.05) particles.add(new Particle(random(width/4, 3*width/4), -100, random(5, 15))); 
  
  for(int i = particles.size()-1; i >= 0; i--){
    Particle p = particles.get(i);
    p.show();
    if(p.isDone()) particles.remove(i);
  }
  
  death.show();
  
  String mensage = "Clique para Ligar/Desligar os motores. \n";
  mensage += death.motorStatus();
  
  fill(255);
  text(mensage, 10, 6*height/7);
  strokeWeight(2);
  if(mouseX > 25 && mouseX < 75 && mouseY > height - 45 && mouseY < height - 15){
    fill(0, 255, 0);
    stroke(255);
  }
  rect(50, height-30, 50, 30);
  
  fill(255);
  stroke(0);
  if(mouseX > 125 && mouseX < 175 && mouseY > height - 45 && mouseY < height - 15){
    fill(0, 255, 0);
    stroke(255);
  }
  rect(150, height-30, 50, 30);
  
  fill(0);
  text("Motor 1", 29, height-25);
  text("Motor 2", 129, height-25);
}

void mousePressed(){
  boolean M1 = false, M2 = false;
  if(mouseX > 25 && mouseX < 75 && mouseY > height - 45 && mouseY < height - 15)
    M1 = true;
  if(mouseX > 125 && mouseX < 175 && mouseY > height - 45 && mouseY < height - 15)
    M2 = true;
  death.controlMotor(M1, M2);
}
