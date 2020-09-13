ArvoreBi arv;

void setup(){
  size(1200, 600);
  background(0);
  arv = new ArvoreBi();
}

void draw(){
  background(0);
  fill(255);
  
  
  text("Quantidade de nós: " + arv.quantNos(arv.Raiz), 20, 20);
  text("Altura da árvore: " + arv.alturaArvore(arv.Raiz), 20, 40);
  
  arv.preOrdem(arv.Raiz, width/2, 10);
}

void mousePressed(){
  arv.insereNo(int(random(1, 100)));
}
