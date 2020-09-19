class ArvoreBi{
  No Raiz;
  
  ArvoreBi(){
    this.Raiz = null;
  }
  
  void show(No atual, float _x, float _y){
     if(atual == null){
       return;
     }
     stroke(255, 0, 0);
     fill(255);
     ellipse(_x, _y, 50, 50);
     fill(0);
     text(atual.valor, _x - 10, _y + 5);
     
     this.show(atual.esq, _x - 75, _y + 50);
     this.show(atual.dir, _x + 75, _y + 50);
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
  
  String preOrdem(No Arvore){
    if(Arvore == null){
      return " ";
    }
    
    String dados = "";
    dados += Arvore.valor + " ";
    dados += this.preOrdem(Arvore.esq);
    dados += this.preOrdem(Arvore.dir);
    
    return dados;
  }
  
  String emOrdem(No Arvore){
    if(Arvore == null){
      return " ";
    }
    
    String dados = "";
    dados += this.emOrdem(Arvore.esq);
    dados += Arvore.valor + " ";
    dados += this.emOrdem(Arvore.dir);
    
    return dados;
  }
  
  String posOrdem(No Arvore){
    if(Arvore == null){
      return " ";
    }
    
    String dados = "";
    dados += this.posOrdem(Arvore.esq);
    dados += this.posOrdem(Arvore.dir);
    dados += Arvore.valor + " ";
    
    return dados;
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
  
  void removeNo(int valor){
    if(this.Raiz == null){
      return;
    }
    No atual, ant;
    atual = this.Raiz;
    ant = null;
    
    while(atual != null){
      if(atual.valor == valor){
        if(atual == this.Raiz){
          this.Raiz = this.removeAtual(atual);
        }else{
          if(valor > ant.valor){
            ant.dir = this.removeAtual(atual);
          }else{
            ant.esq = this.removeAtual(atual);
          }
        }
        return;
      }
      
      ant = atual;
      if(valor > atual.valor){
        atual = atual.dir;
      }else{
        atual = atual.esq;
      }
    }
  }
  
  No removeAtual(No atual){
    No no1, no2;
    if(atual.esq == null){
      no2 = atual.dir;
      atual = null;
      return no2;
    }
    no1 = atual;
    no2 = atual.esq;
    while(no2.dir != null){
      no1 = no2;
      no2 = no2.dir;
    }
    if(no1 != atual){
      no1.dir = no2.esq;
      no2.esq = atual.esq;
    }
    no2.dir = atual.dir;
    atual = null;
    return no2;
  }
}
