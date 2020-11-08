class Cluster{
  ArrayList<Particle> particles;
  ArrayList<VerletSpring2D> springs;
  
  Cluster(int quant, Vec2D center, float Rlength){
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring2D>();
    
    for(int i = 0; i < quant; i++){
      particles.add(new Particle(center.add(Vec2D.randomVector())));
    }
    
    for(int i = 1; i < particles.size(); i++){
      Particle p1 = particles.get(i);
      for(int j = 0; j < i; j++){
        Particle p2 = particles.get(j);
        springs.add(new VerletSpring2D(p1, p2, Rlength, 0.01));
      }
    }
    
  }
  
  void show(){
    if(showPoints){
      for(Particle p : particles){
        p.show();
      }
    }
    
    stroke(255, 80);
    
    if(showLines){
      for(int i = 1; i < particles.size(); i++){
        Particle p1 = particles.get(i);
        for(int j = 0; j < i; j++){
          Particle p2 = particles.get(j);
          line(p1.x, p1.y, p2.x, p2.y);
        }
      }
    }
  }
}
