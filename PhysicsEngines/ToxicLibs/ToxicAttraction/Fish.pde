class Fish {
  float xoff;
  float yoff;
  float xincrement;
  float yincrement;
  float nX;
  float nY;
  float antX;
  float antY;
  float R;
  float G;
  float B;
  String[] nomes;
  String nome;
  Vec2D fishPos;
  
  
  Fish(){
    int nameIDX = (int)random(0, 20);
    this.nomes = new String[] {"Julia", "Rebecca", "Carla", "Diana", "Leia", "Ingrid", "Luana", "Brandon", "Jorge", "James", "Arthur", "Dimitri", "Alexandra", "Maria", "Elizabeth", "Raymond", "Chris", "John", "Willian", "Heloisa"};
    this.nome = nomes[nameIDX];
    
    
    this.R = random(0, 255);
    this.G = random(0, 255);
    this.B = random(0, 255);
    
    this.xoff = random(0, width);
    this.yoff = random(0, height);
    //this.xincrement = (random(-5, 5) + 1) * 0.005;
    //this.yincrement = (random(-5, 5) + 1) * -0.005;
    this.xincrement = 0.01;
    this.yincrement = -0.01;
    
    this.nX = map(noise(xoff), 0, 1, 0, width);
    this.nY = map(noise(yoff), 0, 1, 0, height);
    this.antX = nX;
    this.antY = nY;
    this.fishPos = new Vec2D(nX, nY);
    
    world.addBehavior(new AttractionBehavior2D(this.fishPos, 250, 0.9f));
  }
  
  void update() {
    this.xoff += this.xincrement;
    this.yoff += this.yincrement;
    
    this.nX = map(noise(xoff), 0, 1, 0, width);
    this.nY = map(noise(yoff), 0, 1, 0, height);
    
    this.fishPos.set(this.nX, this.nY);
  }
  
  void show() {
    fill(this.R, this.G, this.B);
    
  
    text(this.nome, this.nX - 20, this.nY - 50);
    triangle(this.nX, this.nY, this.nX - ((this.nX - this.antX) * 5) + 10, this.nY - ((this.nY - this.antY) * 5) - 10, this.nX - ((this.nX - this.antX) * 5) - 10, this.nY - ((this.nY - this.antY) * 5) + 10);
    ellipse(this.nX, this.nY, 40, 40);
    
    this.antX = this.nX;
    this.antY = this.nY;
  }
}
