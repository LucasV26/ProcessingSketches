class Spring{
  PVector position;
  float restL;
  float K;
  boolean connected;
  
  Spring(float _x, float _y, float _rL, float _k){
    this.position = new PVector(_x, _y);
    this.restL = _rL;
    this.K = _k;
    connected = false;
  }
  
  boolean contains(float _x, float _y){
    return (_x > (this.position.x - 10) && _x < (this.position.x + 10) && _y > (this.position.y - 10) && _y < (this.position.y + 10));
  }
  
  void drag(Mover sir){
    if(this.connected){
      PVector spring = PVector.sub(sir.position, this.position); // Calculando o tamanho atual a mola, tanto quanto a direção do vetor da força
      float stretch = spring.mag() - this.restL; // Distorção = cumprimento atual - cumprimento de repouso
      spring.setMag(-this.K * stretch); // Fórmula da força elástica
      sir.applyForce(spring);
      line(sir.position.x, sir.position.y, this.position.x, this.position.y);
    }
  }
  
  void connect(){
    this.connected = true;
  }
  
  void disconnect(){
    this.connected = false;
  }
  
  void show(){
    fill(150, 80);
    if(this.contains(mouseX, mouseY)){
      fill(0, 255, 100, 80);
    }
    rect(this.position.x, this.position.y, 20, 20);
  }
}
