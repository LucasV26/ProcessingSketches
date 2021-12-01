class Grid {
  int resolution;
  int rows, cols;
  PVector[][] grid;
  
  Grid(int r) {
    this.resolution = r;
    this.rows = width / resolution;
    this.cols = height / resolution;
    
    this.grid = new PVector[rows][cols];
    this.init();
  }
  
  void init() {
    noiseSeed((int)random(1000));
    float xoff = 0;
    for(int i = 0; i < this.rows; i++) {
      float yoff = 0;
      for(int j = 0; j < this.cols; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        this.grid[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += -0.1;
    }
  }
  
  void update(float zoff) {
    float xoff = 0;
    for(int i = 0; i < this.rows; i++) {
      float yoff = 0;
      for(int j = 0; j < this.cols; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        this.grid[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += -0.1;
    }
  }
  
  void display() {
    for(int i = 0; i < this.rows; i++)
      for(int j = 0; j < this.cols; j++)
        this.drawVector(this.grid[i][j], i * this.resolution, j * this.resolution, this.resolution - 2);
  }
  
  void drawVector(PVector vector, float x, float y, float scale) {
    pushMatrix();
    float arrowSize = 4;
    
    translate(x, y);
    stroke(255, 0, 0);
    rotate(vector.heading());
    
    float size = vector.mag() * scale;
    
    line(0, 0, size, 0);
    line(size,0,size-arrowSize,+arrowSize/2);
    line(size,0,size-arrowSize,-arrowSize/2);
    popMatrix();
  }
  
  PVector lookUp(PVector position) {
    int row = int(constrain(position.x / resolution, 0, this.rows - 1));
    int col = int(constrain(position.y / resolution, 0, this.cols - 1));
    
    return this.grid[row][col].copy();
  }
}
