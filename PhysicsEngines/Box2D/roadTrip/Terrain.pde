class Terrain{
  ArrayList<Vec2> road;
  
  Terrain(){
    road = new ArrayList<Vec2>();
    float theta = 0;
    float amp = 4*height/7;
    float freq = 0.01;
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
    
    b.createFixture(cs, 1);
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
