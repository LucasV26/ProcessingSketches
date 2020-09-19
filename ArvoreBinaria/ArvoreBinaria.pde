ArvoreBi arv;

void setup(){
  size(1200, 600);
  background(0);
  arv = new ArvoreBi();
  
}

void draw(){
  background(0);
  
  arv.show(arv.Raiz, width/2, 50);
  
  fill(255);
  text("Quantidade de nós: " + arv.quantNos(arv.Raiz), 20, 20);
  text("Altura da árvore: " + arv.alturaArvore(arv.Raiz), 20, 40);
  
  text("Árvore em PréOrdem: " + arv.preOrdem(arv.Raiz), 20, height - 60);
  text("Árvore EmOrdem: " + arv.emOrdem(arv.Raiz), 20, height - 40);
  text("Árvore em PósOrdem: " + arv.posOrdem(arv.Raiz), 20, height - 20);
}

void mousePressed(){
  /*// Ao remover o Nó 11 a maior folha da sub-árvore esquerda assume seu lugar
  arv.removeNo(11);*/
  
  arv.insereNo(int(random(1000)));
}
