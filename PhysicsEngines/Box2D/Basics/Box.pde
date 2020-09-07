class Box {
  float w;
  float h;

  Body boxB;

  Box(float x_, float y_) {
    this.w = random(10, 20);
    this.h = random(10, 20);
    
    //Modularizando todo o código de criação do corpo B2D:
    makeBody(new Vec2(x_, y_), this.w, this.h); 
  }

  void makeBody(Vec2 position, float _w, float _h) {
    // Criando a definição do corpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(position)); // Convertendo os parâmetros de Pixels para o Mundo de Box2d

    // Criando o corpo a partir de sua definição préviamente criada
    this.boxB = box2d.createBody(bd);

    // Criando o formato do corpo
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(_w/2);
    float b2dH = box2d.scalarPixelsToWorld(_h/2);
    ps.setAsBox(b2dW, b2dH); // Utilizando variáveis convertidas de Pixels para o Mundo

    // Criando a Fixture (Fixture é o que une o corpo ao seu formato)
    FixtureDef fd = new FixtureDef();
    fd.shape = ps; // Acoplando o formato préviamene feito à Frixture
    // Algumas configurações físicas
    fd.density = random(1, 2);
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Acoplando tudo junto no final
    this.boxB.createFixture(fd);
  }
  
  void suicide(){
    box2d.destroyBody(this.boxB);
  }

  void show() {
    Vec2 position = box2d.getBodyPixelCoord(this.boxB);  
    float a = boxB.getAngle();

    pushMatrix();
    translate(position.x, position.y);
    rotate(-a);
    rect(0, 0, this.w, this.h);
    popMatrix();
  }
}
