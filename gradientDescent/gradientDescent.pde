float[] X = {100.7, 350, 410.3, 720.6, 1250.8, 450.12, 225.34, 512.12, 687.15};
float[] Y = {380.8, 150.9, 560.6, 200.3, 725.12, 50.12, 95.34, 112.12, 787.15};
float alpha;
float beta;
float w0;
float w1;
float t;

float Y_hip(float x, float w0, float w1){
  float y = w0 + w1*x;
  return y;
}

float passo_grad_w0(float[] X, float[] Y, float w0, float w1){
  float soma = 0;
  for(int i=0; i<X.length; i++){
    soma += Y_hip(X[i], w0, w1) - Y[i];
  }
  return soma;
}

float passo_grad_w1(float[] X, float[] Y, float w0, float w1){
  float soma = 0;
  for(int i=0; i<X.length; i++){
    soma += (Y_hip(X[i], w0, w1) - Y[i]) * X[i];
  }
  return soma;
}

float gradiente_w0(float[] X, float[] Y, float w0, float w1, float alpha){
  float m = X.length;
  w0 -= alpha * 1/m * passo_grad_w0(X, Y, w0, w1);
  return w0;
}

float gradiente_w1(float[] X, float[] Y, float w0, float w1, float beta){
  float m = X.length;
  w1 -= beta * 1/m * passo_grad_w0(X, Y, w0, w1);
  return w1;
}

float custo(float[] X, float[] Y, float w0, float w1){
  float custo = 0;
  float m = X.length;
    for(int i=0; i<m; i++){
      custo += Math.pow((Y_hip(X[i], w0, w1) - Y[i]), 2);
    }
  custo /= m;
  return custo;
}

void setup(){
  size(1500, 900);
  alpha = 0.0015;
  beta = 0.000015;
  w0 = random(-1000, 1000);
  w1 = w0/100;
  t = 0;
}

void draw(){
  background(255);
  for(int i=0; i<X.length; i++){
    stroke(0);
    fill(0);
    ellipse(X[i], Y[i], 25, 25);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    text("Erro", X[i] + 10, Y_hip(X[i], w0, w1) + ((Y[i] - Y_hip(X[i], w0, w1)) / 2));
    line(X[i], Y[i], X[i], Y_hip(X[i], w0, w1));
  }
  
  float Xstart = 0;
  float Xend = 1500;
  stroke(255, 0, 0);
  fill(255, 0, 0);
  text("Hipótese", width/2 - 60, Y_hip(width/2, w0, w1));
  line(Xstart, Y_hip(Xstart, w0, w1), Xend, Y_hip(Xend, w0, w1));
  w0 = gradiente_w0(X, Y, w0, w1, alpha);
  w1 = gradiente_w1(X, Y, w0, w1, beta);
  
  stroke(0, 0, 255);
  fill(0, 0, 255);
  text("Custo", t + 50, 0.01*custo(X, Y, w0, w1));
  ellipse(t, 0.01*custo(X, Y, w0, w1), 50, 50);
  t += 0.5;
}
