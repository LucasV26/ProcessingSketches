class System{
  ArrayList<Particle> particles;
  PVector position;
  
  System(float _x, float _y){
    particles = new ArrayList<Particle>();
    this.position = new PVector(_x, _y);
  }
  
  void addParticle(){
    particles.add(new Particle(this.position.x, this.position.y));
  }
  
  void run(){
    for(int i = particles.size() - 1; i >= 0; i--){
    Particle p = particles.get(i);
    p.update();
    p.show();
    
    if(p.lifeSpan <= 0) particles.remove(i);
  }
  }
}
