import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Particles[] particles;

float w_space;
int quant;

void setup(){
  size(800, 600);
  rectMode(CENTER);
  background(0);
  
  w_space = 16;
  quant = int(width/w_space);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  particles = new Particles[quant+1];
  
  float x = 0;
  for(int i = 0; i<quant + 1; i++){
    particles[i] = new Particles(x, 50, (i == 0 || i == quant));
    x += w_space;
  }
}

void draw(){
  background(0);
  stroke(255);
  fill(100);
  
  box2d.step();
  
  for(Particles p : particles){
    p.show();
  }
}
