class Plataform {
  // Criar uma plataforma resume-se a, basicamente, criar um corpo estático
  float w;
  float h;

  Body platB;

  Plataform(float x_, float y_, float w_, float h_, float a_) {
    this.w = w_;
    this.h = h_;
    
    //Modularizando todo o código de criação do corpo B2D:
    makeBody(new Vec2(x_, y_), this.w, this.h, a_); //Visto que o ojeto estático não será atualizado, nós settamos um ângulo inicial
  }

  void makeBody(Vec2 position, float _w, float _h, float _a) {
    // Criando a definição do corpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = _a; // O ângulo é settado na definição do corpo
    bd.position.set(box2d.coordPixelsToWorld(position)); // Convertendo os parâmetros de Pixels para o Mundo de Box2d

    // Criando o corpo a partir de sua definição préviamente criada
    this.platB = box2d.createBody(bd);

    // Criando o formato do corpo
    PolygonShape ps = new PolygonShape();
    float b2dW = box2d.scalarPixelsToWorld(_w/2);
    float b2dH = box2d.scalarPixelsToWorld(_h/2);
    ps.setAsBox(b2dW, b2dH); // Utilizando variáveis convertidas de Pixels para o Mundo

    // Criando a Fixture (Fixture é o que une o corpo ao seu formato)
    FixtureDef fd = new FixtureDef();
    fd.shape = ps; // Acoplando o formato préviamene feito à Frixture
    // Algumas configurações físicas
    fd.friction = 0.1;
    fd.restitution = 0.5;

    // Acoplando tudo junto no final
    this.platB.createFixture(fd);
  }

  void show() {
    // De resto é tudo idêntico à um objeto dinâmico
    Vec2 position = box2d.getBodyPixelCoord(this.platB);  
    float a = platB.getAngle();

    pushMatrix();
    translate(position.x, position.y);
    rotate(-a);
    rect(0, 0, this.w, this.h);
    popMatrix();
  }
}
