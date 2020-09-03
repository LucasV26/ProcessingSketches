ArrayList<Particle> particles;

void setup(){
  particles = new ArrayList<Particle>();
  size(800, 600);
}

void draw(){
  background(0);
  particles.add(new Particle());
  
  for(int i = particles.size() - 1; i >= 0; i--){
    Particle p = particles.get(i);
    p.update();
    p.show();
    
    if(p.lifeSpan <= 0) particles.remove(i);
  }
}
