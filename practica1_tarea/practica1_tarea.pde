
class Pelota{
  float vx,vy;
  float x,y,radio;
  int ban;
  
  // constructor
  Pelota(){
    x=random(-300,600);
    y=random(1) > 0.5? -300 : 600;
    ban = 0;
    radio = 50;
  }
  
  
  void dibuja(){
    if(ban == 0){
      ban = 1;
      fill(random(0,255),random(0,255),random(0,255));
    }
    
    circle(x,y,radio);
  }
  
  void asignaV(){
    vx = random(-5,5);
    vy = random(-5,5);
  }
  
  void mueve(){
    if(y < 0 && x > 0){
      x += vx;
      y += vy;
    }
  }
}

Pelota[] pelotas = new Pelota[25];

void setup(){
  background(random(0,255),random(0,255),random(0,255));
  size(600,600);
  
  for(int i = 0;i < 25;i++){
    pelotas[i] = new Pelota();
    pelotas[i].asignaV();
  }
}

void draw(){
  //translate(width/2,height/2);
  
  for(int i=0;i<25;i++){
    pelotas[i].dibuja();
    pelotas[i].mueve();
  }
}
