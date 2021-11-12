Proces p0, p1, p2, p3, p4;
Memoria m;

void setup() {
  size(1400, 1400);
  p0 =new Proces("SO", color (250, 130, 120), 128);
  p1 =new Proces("P1", color (233, 130, 120), 256);
  p2 =new Proces("P2", color (250, 100, 120), 128);
  p3 =new Proces("P3", color (250, 130, 20), 128);
  p4 =new Proces("P4", color (250, 104, 110), 64);

  m = new Memoria(1024);
}

void draw() {
  background(255);

  m.display();

  if (frameCount==100) {
    m.swapIn (p0);
  }
  if (frameCount==200) {
    m.swapIn(p1);
  }
  if (frameCount==300) {
    m.swapIn(p2);
  }
  if (frameCount==400) {
    m.swapIn(p3);
  }
  if (frameCount==500) {
    m.swapIn(p4);
  }
  if (frameCount==600) {
    m.swapOut(p1);
  }
  if (frameCount==700) {
    m.swapIn(p4);
  }
  if (frameCount==800) {
    m.swapOut(p2);
  }
  if (frameCount==900) {
    m.swapIn(p3);
  }
  
  
  
  
}

void keyPressed(){
  if(key=='p'){
    m.compacta();
  }
}
