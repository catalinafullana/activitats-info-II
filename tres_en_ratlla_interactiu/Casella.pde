class Casella {
  int row, column, value, x, y, w;

  Casella(int f, int c, int x, int y, int w) {
    this.row    = f;
    this.column = c;
    this.value   = 0;
    this.x = x;
    this.y = y;
    this.w = w;
  }

  void setValue(int v) {
    this.value = v;
  }

  void display() {
    rect(x, y, w, w);

    if (value==1) {
      stroke(255,0,0);
      strokeWeight(20);
      line(x, y, x+w, y+w);
      line(x, y+w, x+w, y);
      stroke(0,0,0);
      strokeWeight(1);
    } else if (value == 2) {
      ellipse(x + w/2, y + w/2, w/2, w/2);
    }
  }

  boolean inside(float x, float y) {
    return (this.x<=x && x<=this.x+w &&
        this.y<=y && y<=this.y+w);
  }
}
