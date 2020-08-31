float a;
float r;

void setup(){
  fullScreen();
  a = 0;
  r = 0;
  background(0);
}

void draw(){
  //background(0);
  noFill();
  stroke(255);
  
  float x = r * cos(a);
  float y = r * sin(a);
  // Seguindo a trigonometria, um ponto qualquer (X, Y) pode ser definido por seu raio e seu ângulo em relação ao centro
  
  translate(width/2, height/2);
  ellipse(x, y, 2, 2);
  
  a += 0.01;
  r += 0.02;
}
