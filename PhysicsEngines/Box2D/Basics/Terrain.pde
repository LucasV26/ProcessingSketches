class Terrain{
  ArrayList<Vec2> terrain;

  Terrain(){
    this.terrain = new ArrayList<Vec2>();
    
    // Pra crir um terreno, precisamos de todos os vértices que o compõe
    terrain.add(new Vec2(0, height-100));
    terrain.add(new Vec2(50, height-150));
    terrain.add(new Vec2(100, height-100));
    terrain.add(new Vec2(250, height-500));
    terrain.add(new Vec2(width/2, height-200));
    terrain.add(new Vec2(600, height-200));
    terrain.add(new Vec2(700, height));
    terrain.add(new Vec2(width, height-200));
    
    // Terrenos, no mundo de Box2D, são representados por ChainShapes
    
    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[terrain.size()];
    for(int i = 0; i<vertices.length; i++){
      // Pegando as coordenadas em pixels e às convertendo para o mundo de B2D dentro de outro array
      vertices[i] = box2d.coordPixelsToWorld(terrain.get(i));
    } 
    // Criando a cadeia com este novo array
    chain.createChain(vertices, vertices.length);
    
    // Agora que temos o formato de nosso terreno, vamos acomplá-lo a um corpo
    
    BodyDef bd = new BodyDef(); // Criando uma definição de corpo
    Body b = box2d.createBody(bd); // Criando um corpo e acoplando sua definição
    
    //Se necessário, pode-se criar uma Fixture para configurar atrito entre outras coisas
    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.restitution = 5; // O terreno é bem elástico
    
    b.createFixture(fd); // Acoplando o formato ao corpo
  }
  
  void show(){
    fill(255, 0, 255);
    stroke(255);
    
    beginShape();
    
      for(Vec2 v : this.terrain){
        vertex(v.x, v.y);
      }
      vertex(width, height);
      vertex(0, height);
    
    endShape(CLOSE);
  }
}
