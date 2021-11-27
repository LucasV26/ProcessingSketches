class Attractor extends VerletParticle2D {
  float mass;
  
  Attractor(Vec2D position, float mass) {
    super(position);
    this.mass = mass;
    
    world.addParticle(this);
    world.addBehavior(new AttractionBehavior2D(this, mass*4, mass/1000));
  }
  
  
  void show() {
    stroke(255, 255, 0);
    noFill();
    ellipse(this.x, this.y, this.mass, this.mass);
  }
}
