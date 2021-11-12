class Proces {
  String nom;
  int mida;
  color c;

  int address;

  Proces (String n, color c, int m) {
    this. nom = n;
    this.c = c;
    this.mida = m;
  }

  void setAddress(int a) {
    this.address = a;
  }

  void display (float x, float y, float h) {
    fill(this.c);
    stroke(0);
    strokeWeight(3);
    rect(x + this.address, y, this.mida, h);

    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(this.nom, x+ this.address + this.mida/2, y + h/2);
  }
}
