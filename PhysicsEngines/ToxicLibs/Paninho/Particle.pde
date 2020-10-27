class Particle extends VerletParticle2D{
  Particle(Vec2D position){
    super(position);
  }
  
  void show(){
    stroke(255, 0, 0);
    noFill();
    ellipse(x, y, 2, 2);
  }
}
