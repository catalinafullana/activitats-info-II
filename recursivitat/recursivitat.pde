void setup() {
  size(800, 800);
}

void draw() {
  fill(230, 230, 255);
  strokeWeight(0.2);
  background(255, 255, 230);
  rectMode(CENTER);
  graella(width/2, height/2, 500, 500);
}

void graella(int x, int y, int w, int h) {
  rect(x, y, w, h);
  if (w>10) {
    graella(x-w/4, y+h/4, w/2, h/2);
    fill(230, 255, 255);
    graella(x+w/4, y-h/4, w/2, h/2);
    graella(x-w/4, y+h/4, w/2, h/2);
    graella(x+w/4, y-h/4, w/2, h/2);
  }
}
