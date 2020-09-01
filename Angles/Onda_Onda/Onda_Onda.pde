int x_space = 1;
int maxWaves = 2;

float theta = 0;
float[] amplitude = new float[maxWaves];
float[] angular_velocity = new float[maxWaves];
float[] Y;
float H = 0;

void setup() {
  fullScreen();
  //size(1000, 600);
  for (int i=0; i<maxWaves; i++) {
    amplitude[i] = height / (maxWaves * random(1, 5));
    angular_velocity[i] = random(0.001, 0.1);
  }

  Y = new float[width / x_space];
  //background(0);
}

void draw() {
  background(0);
  fill(0, 250, 247, 100);
  //noStroke();
  stroke(0, 100, 255, 80);
  translate(0, height/2);

  int i=0;
  for (int x=0; x<width; x+=x_space) {
    Y[i] = 0;
    for (int j=0; j<maxWaves; j++) {
      Y[i] += amplitude[j] * sin(theta + (i * angular_velocity[j]));
    }
    rect(x, Y[i], x_space, H);
    i++;
  }

  for (int k=0; k<maxWaves; k++) {
    theta += (angular_velocity[k]) / maxWaves;
    H += amplitude[k];
  }
}

void mousePressed() {
  setup();
}
