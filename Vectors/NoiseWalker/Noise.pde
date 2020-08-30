class Noise{
  float X;
  float Y;
  float Tx = 0;
  float Ty = 10;
  
  Noise(float X, float Y){
    this.X = X;
    this.Y = Y;
  }
  
  void walk(){
    float noiX = noise(this.Tx); // Noise cria um gráfico com pontos 'aleatórios' que são distribuidos conforme a passagem do tempo (tempo = ponto do gráfico = parâmetro da função);
    float noiY = noise(this.Ty); // Sempre retorna um valor entre 0 e 1 (Quase como seno e cosseno) é necessário mapear;
    noiX = map(noiX, 0, 1, 0, width);
    noiY = map(noiY, 0, 1, 0, height);
    this.X = noiX;
    this.Y = noiY;
    this.Tx += 0.0005;
    this.Ty += 0.0005;
    /*this.X = constrain(this.X, 0, 600);
    this.Y = constrain(this.Y, 0, 600);*/ //Limitar uma variável à certo range de valores
  }
  
  void display(){
    point(this.X, this.Y);
  }
}
