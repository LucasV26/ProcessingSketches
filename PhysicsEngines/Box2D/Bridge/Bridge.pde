/* Para utilizar joints é neecssário adicionar mais bibliotecas */
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Particle[] particles;

float w_space;
int quant;

ArrayList<Joint> joints;

ArrayList<Box> boxes;

void setup(){
  //size(800, 600);
  fullScreen();
  rectMode(CENTER);
  background(0);
  
  w_space = 20;
  quant = int(width/w_space);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  
  particles = new Particle[quant+1];
  
  joints = new ArrayList<Joint>();
  
  float x = 0;
  for(int i = 0; i<quant + 1; i++){
    //Criando n partículas da ponte que cruzam a tela
    particles[i] = new Particle(x, 200, w_space/2, (i == 0 || i == quant));
    x += w_space;
  }
  
  for(int i = 0; i<quant; i++){
    joints.add(new Joint(particles[i], particles[i+1]));
  }
}

void draw(){
  background(0);
  
  box2d.step();
  
  for(Particle p : particles){
    p.show();
  }
  
  for(Joint j : joints){
    j.show();
  }
  
  for(int i = 0; i < boxes.size(); i++){
    Box b = boxes.get(i);
    b.show();
    
    Vec2 pos = box2d.getBodyPixelCoord(b.body);
    
    if(pos.x < 0 || pos.x > width || pos.y > height){
      b.suicide();
      boxes.remove(i);
    }
  }
}

void mouseDragged(){
  boxes.add(new Box(mouseX, mouseY));
}
