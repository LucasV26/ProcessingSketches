class Particle extends VerletParticle2D {
  Particle(Vec2D position) {
    super(position);

    world.addParticle(this);
    world.addBehavior(new AttractionBehavior2D(this, 100, -1.2f));
  }

  void show() {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    //point(this.x, this.y);
    ellipse(this.x, this.y, 5, 5);
  }
}
