class Terrain{
  ArrayList<Vec2> road;
  
  Terrain(){
    road = new ArrayList<Vec2>();
    float theta = 0;
    float amp = random(3*height/4, 6*height/7);
    float freq = amp/30000;
    float y;
    
    for(int i = 0; i < width; i++){
      y = sin(theta + ((i+1) * freq));
      y = map(y, -1, 1, amp, height);
      road.add(new Vec2(i, y));
    }
    
    ChainShape cs = new ChainShape();
    Vec2[] vertices = new Vec2[road.size()];
    for(int i = 0; i < vertices.length; i++){
      vertices[i] = box2d.coordPixelsToWorld(road.get(i));
    }
    
    cs.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body b = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.friction = 1;
    fd.density = 1.1;
    fd.restitution = 0.3;
    
    b.createFixture(fd);
  }
  
  void show(){
    fill(255, 150, 0);
    stroke(0);
    beginShape();
      for(Vec2 v : road){
        vertex(v.x, v.y);
      }
      vertex(width, height);
      vertex(0, height);
    endShape(CLOSE);
  }
}
