import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Criando objeto que representa o mundo
Box2DProcessing box2d;

ArrayList<Box> boxes;

Plataform plat, plat2;

Terrain ter;

void setup(){
  size(800, 600);
  background(0);
  rectMode(CENTER);
  
  // Inicializando o mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Criando lista de corpos dinâmicos
  boxes = new ArrayList<Box>();
  // Criando corpos estáticos como plataformas
  plat = new Plataform(100, height/4, 100, 5, -0.5);
  plat2 = new Plataform(3*width/4, 50, 500, 5, PI/4);
  // Criando ChainShape que funcionará como terreno
  ter = new Terrain();
}

void draw(){
  background(0);
  // Atualizando o mundo com o passar do tempo
  box2d.step();
  
  ter.show(); // Desenhando terreno
  fill(0, 0, 255);
  stroke(255);
  // Desenhando plataformas
  plat.show();
  plat2.show();
  
  noFill();
  // Criando novos corpos dinâmicos
  if(random(1) < 0.1) boxes.add(new Box(random(0, width), 100));
  
  Vec2 pos; 
   
  for(int i = boxes.size()-1; i>=0; i--){
    Box b = boxes.get(i);
    pos = box2d.getBodyPixelCoord(b.boxB); //Pegando a posição atual do corpo no mundo de Box2D
    if(pos.y > height || pos.x < 0 || pos.x > width){
      // Apagando a existência dos corpos que saíram da tela
      b.suicide();
      boxes.remove(i); 
    }
    // Desenhando as caixas
    b.show();
  }
}
