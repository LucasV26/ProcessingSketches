// Algoritmo com concenitos básicos de Box2D, como, criação de mundo, corpo estático, corpo dinâmico e ChainShape

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Criando objeto que representa o mundo
Box2DProcessing box2d;

ArrayList<Polygon> polygons;

ArrayList<MultiShape> shapes;

Plataform plat, plat2, plat3;

Terrain ter;

void setup(){
  size(800, 600);
  background(0);
  rectMode(CENTER);
  
  // Inicializando o mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // Criando lista de corpos dinâmicos com forma astrata
  polygons = new ArrayList<Polygon>();
  // Criando lista de corpos dinâmicos com múltiplas formas
  shapes = new ArrayList<MultiShape>();
  // Criando corpos estáticos como plataformas
  plat = new Plataform(width/2, 100, 200, 5, 0);
  plat2 = new Plataform(width-100, height-100, 200, 5, PI/4);
  plat3 = new Plataform(100, height-100, 200, 5, -PI/4);
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
  plat3.show();
  
  noFill();
  // Criando novos corpos dinâmicos
  if(random(1) < 0.05) polygons.add(new Polygon(width/2, 200));
  
  Vec2 pos; 
   
  for(int i = polygons.size()-1; i>=0; i--){
    Polygon p = polygons.get(i);
    pos = box2d.getBodyPixelCoord(p.polyB); //Pegando a posição atual do corpo no mundo de Box2D
    // Desenhando as caixas
    p.show();
    
    if(pos.y > height || pos.x < 0 || pos.x > width){
      // Apagando a existência dos corpos que saíram da tela
      p.suicide();
      polygons.remove(i); 
    }
  }
  
  for(int i = shapes.size()-1; i>=0; i--){
    MultiShape ms = shapes.get(i);
    pos = box2d.getBodyPixelCoord(ms.multiB); //Pegando a posição atual do corpo no mundo de Box2D
    // Desenhando as caixas
    ms.show();
    
    if(pos.y > height || pos.x < 0 || pos.x > width){
      // Apagando a existência dos corpos que saíram da tela
      ms.suicide();
      shapes.remove(i); 
    }
  }
}

void mousePressed(){
  shapes.add(new MultiShape(mouseX, mouseY));
}
