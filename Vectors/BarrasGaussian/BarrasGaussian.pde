import java.util.Random;
Random gen;

Bar[] barra;

void setup(){
  size(1000, 600);
  background(0);
  barra = new Bar[width];
  for(int i=0; i < barra.length; i++){
    barra[i] = new Bar(i);
  }
  gen = new Random();
}

void draw(){
  stroke(255);
  strokeWeight(3);
  /*int rand = (int) gen.nextGaussian();
  rand += width/2;*/ //Código para gerar npumero aleatório Gaussiano (Usar rand como index)
  int rand1 = int(random(width));
  int rand2 = int(random(width));
  for(int i=0; i < barra.length; i++){
    barra[i].Display();
  }
  if(rand2 * 2 < rand1){
    barra[rand1].Grow();
  }
}
