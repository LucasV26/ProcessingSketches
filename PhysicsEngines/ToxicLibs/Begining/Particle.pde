class Particle extends VerletParticle2D{
  // Tudo que precisamos para lidar com partículas está em VerletParticle2D, então herdamos esta classe
  Particle(Vec2D position){
    super(position);
  }
  
  void show(){
    stroke(255);
    noFill();
    ellipse(x, y, 100, 100);
  }
}
