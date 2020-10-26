import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

// O mundo em ToxicLibs é chamado de VerletPhysics 
VerletPhysics2D world;

Particle p1, p2;

void setup(){
  size(1200, 600);
  background(0);
  
  // Inicializamos o mundo e adicionamos uma força de atração gravitacional
  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  // Configuramos os limites do mundo (sem necessidade de criar STATIC bodys como em Box2D)
  world.setWorldBounds(new Rect(0, 0, width, height));
  
  p1 = new Particle(new Vec2D(width/2, 0));
  p2 = new Particle(new Vec2D(3*width/4, 0));
  
  p1.lock();
  
  // Springs são criadas a partir de duas partículas, um restLength e uma strength
  VerletSpring2D spring = new VerletSpring2D(p1, p2, 400, 0.01);
  
  // Adicionando os corpos criados ao mundo
  world.addParticle(p1);
  world.addParticle(p2);
  world.addSpring(spring);
}

void draw(){
  background(0);
  
  world.update();
  
  p1.show();
  p2.show();
  
  stroke(255);
  line(p1.x, p1.y, p2.x, p2.y);
  
  if(mousePressed){
    if(p2.distanceTo(new Vec2D(mouseX, mouseY)) <= 50){
      p2.lock();
      p2.x = mouseX;
      p2.y = mouseY;
      p2.unlock();
    }
  }
}
