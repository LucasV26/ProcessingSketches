class System {
  ArrayList<Particle> particles;
  PVector position;
  PImage photo;

  System(float _x, float _y, PImage _p) {
    particles = new ArrayList<Particle>();
    this.position = new PVector(_x, _y);
    this.photo = _p;
  }

  void applyForce(PVector f, boolean m) {
    for (Particle p : particles) {
      if (m) {
        PVector force = f.copy();
        force.mult(p.mass);
        p.applyForce(force);
      } else {
        p.applyForce(f);
      }
    }
  }

  void addParticle() {
    particles.add(new Rock(this.position.x, this.position.y, 50, -100, this.photo));
  }

  void run() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.show();

      if (p.position. y > height) {
        particles.remove(i);
      }
      if (p.isDead()) {
        int qtd = (int) random(3, 6);
        for (int count = 0; count<qtd; count++) {
          particles.add(new Rock(p.position.x, (p.position.y + (p.mass*2)) + ((height - this.position.y) / 2), p.mass*2/qtd, p.position.y, this.photo));
        }
        particles.remove(i);
      }
    }
  }
}
