class Particle extends VerletParticle2D {
  Particle(Vec2D position) {
    super(position);
    
    world.addParticle(this);
  }

  void show() {
    stroke(255);
    noFill();
    point(this.x, this.y);
  }
}
