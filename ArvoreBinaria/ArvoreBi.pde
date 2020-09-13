class ArvoreBi{
  No Raiz;
  
  ArvoreBi(){
    this.Raiz = null;
  }
  
  int alturaArvore(No Arvore){
    if(Arvore == null){
      return 0;
    }
    int alt_esq, alt_dir;
    alt_esq = this.alturaArvore(Arvore.esq);
    alt_dir = this.alturaArvore(Arvore.dir);
    
    if(alt_esq > alt_dir){
      return (alt_esq + 1);
    }else{
      return (alt_dir + 1);
    }
  }
  
  int quantNos(No Arvore){
    if(Arvore == null){
      return 0;
    }
    
    int alt_esq, alt_dir;
    alt_esq = this.quantNos(Arvore.esq);
    alt_dir = this.quantNos(Arvore.dir);
    
    return (alt_esq + alt_dir + 1);
  }
  
  void preOrdem(No Arvore, float _x, float _y){
    if(Arvore == null){
      return;
    }
    fill(255);
    stroke(255);
    ellipse(_x, _y, 30, 30);
    fill(0);
    text(Arvore.valor, _x - 5, _y);
    this.preOrdem(Arvore.esq, _x - 45, _y + 25);
    this.preOrdem(Arvore.dir, _x + 45, _y + 25);
  }
  
  void emOrdem(No Arvore, float _x, float _y){
    if(Arvore == null){
      return;
    }
    this.preOrdem(Arvore.esq, _x - 45, _y + 25);
    fill(255);
    ellipse(_x, _y, 30, 30);
    fill(0);
    text(Arvore.valor, _x - 5, _y);
    this.preOrdem(Arvore.dir, _x + 45, _y + 25);
  }
  
  void posOrdem(No Arvore, float _x, float _y){
    if(Arvore == null){
      return;
    }
    this.preOrdem(Arvore.esq, _x - 45, _y + 25);
    this.preOrdem(Arvore.dir, _x + 45, _y + 25);
    fill(255);
    ellipse(_x, _y, 30, 30);
    fill(0);
    text(Arvore.valor, _x - 5, _y);
  }
  
  void insereNo(int valor){
    No novoNo = new No(valor);
    if(this.Raiz == null){
      this.Raiz = novoNo;
    }else{
      No atual, ant;
      atual = this.Raiz;
      ant = null;
      while(atual != null){
        ant = atual;
        if(atual.valor == valor){
          return;
        }
        
        if(valor > atual.valor){
          atual = atual.dir;
        }else{
          atual = atual.esq;
        }
      }
      
      if(valor > ant.valor){
        ant.dir = novoNo;
      }else{
        ant.esq = novoNo;
      }
    }
  }
}
