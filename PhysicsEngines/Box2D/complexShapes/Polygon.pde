class Polygon {
  Body polyB;

  Polygon(float x_, float y_) {
    
    //Modularizando todo o código de criação do corpo B2D:
    makeBody(new Vec2(x_, y_)); 
  }

  void makeBody(Vec2 center) {
    // Criando o formato do corpo
    PolygonShape ps = new PolygonShape();
    
    Vec2[] vertices = new Vec2[4]; // Utilizando vértices para criar um corpo não padronizado

    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(0, 25)); // Na declaração de cada vértice usamos a converção de vector
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-5, 25));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-5, -15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(10, -15));
    
    ps.set(vertices, vertices.length); // Utilizando variáveis convertidas de Pixels para o Mundo

    // Criando a definição do corpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center)); // Convertendo os parâmetros de Pixels para o Mundo de Box2d

    // Criando o corpo a partir de sua definição préviamente criada
    this.polyB = box2d.createBody(bd);

    // Acoplando tudo junto no final
    // Utilizando o shortcut para criação de Fixture (Sem configuração de atrito, elasticidade, etc)
    this.polyB.createFixture(ps, 1.0);
    
    polyB.setLinearVelocity(new Vec2(random(-10, 10), random(-5, 5)));
    polyB.setAngularVelocity(random(-5, 5));
  }
  
  void suicide(){
    box2d.destroyBody(this.polyB);
  }

  void show() {
    Vec2 position = box2d.getBodyPixelCoord(this.polyB);  
    float a = this.polyB.getAngle();
    
    // Recuperando o formato de dentro do corpo
    Fixture f = this.polyB.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    pushMatrix();
      translate(position.x, position.y);
      rotate(-a);
      beginShape();
        for(int i=0; i< ps.getVertexCount(); i++){ // Contando quantos vértices existem no formato
          // Recuperando cada vértice separadamente
          Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i)); // Na recuperação da posição de cada vértice usamos a converção de vector
          vertex(v.x, v.y);
        }
      endShape(CLOSE);
    popMatrix();
  }
}
