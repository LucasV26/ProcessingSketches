float a;

void setup(){
  fullScreen();
  rectMode(CENTER);
  a = 0;
  background(0);
}

void draw(){
  //background(0);
  
  noFill();
  stroke(150, 100);
  translate(width/2, height/2);
  
  pushMatrix(); //Cria uma matrix separada do laço anterior (Translates e Rotates só alterarão os códigos dentro da matrix
    rotate(-a);
    rect(0, 0, 200, 100);
  popMatrix(); //Fecha a matrix criada no pushMatrix()
  
  pushMatrix();
    rotate(a);
    stroke(255, 0, 0, 100);
    line(-49, 0, 49, 0);
    stroke(0, 100);
    line(-25, 0, 25, 0);
  popMatrix(); 
  
  pushMatrix();
    stroke(255, 255, 0, 100);
    rotate(a/100);
    translate(-145, 0);
    rotate(-a);
    line(-25, 0, 25, 0);
  popMatrix();
  
  stroke(255, 100);
  
  pushMatrix();
    rotate(a);
    translate(150, 200);
    rotate(-a/500);
    rect(0, 0, 100, 50);
  popMatrix(); 
  
  stroke(0, 255, 255, 100);
  
  pushMatrix();
    rotate(a); // Rotaciona com base no centro da tela
    translate(-250, -250);
    ellipse(-20, 20, 10, 10);
    rotate(a); // Rotaciona com base no ponto (-250, -250)
    ellipse(-20, 20, 10, 10);
  popMatrix();
  
  pushMatrix();
    rotate(a); // Rotaciona com base no centro da tele
    translate(250, 250);
    ellipse(-20, 20, 10, 10);
    rotate(-a); // Rotaciona com base no ponto (250, 250)
    ellipse(-20, 20, 10, 10);
  popMatrix(); //Fecha a matrix criada no pushMatrix()
  
  stroke(255, 100);
  
  pushMatrix(); 
    rotate(-a/250);
    translate(-400, -250);
    rotate(-2*a); // Rotaciona com base no ponto (250, 250)
    ellipse(-20, 20, 5, 5);
  popMatrix(); 
  
  a += 1;
  
  // pushMatrix() e popMatrix() são utilizados quando se quer rotar mais de um objeto com referenciais diferentes sem que um afete o outro
}
