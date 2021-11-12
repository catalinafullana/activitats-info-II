Casella [][] t;      //[fil][col]
boolean win = false;
int nPlays = 0;

String txt;
int pantalla = 0;


void setup() {
  size(900, 900);
  createTable();
}

void draw() {


  if (pantalla==0) {
    background(255);
    drawTable();
    if (!win && nPlays<9) {
      if (winRows()||winCols()||winAscendentDiag()||winDescendentDiag()) {
        win = true;
      }
    }

    if (nPlays ==9 && !win) {
      textSize(50);
      textAlign(CENTER);
      stroke(255, 0, 0);
      text("END. TABLAS", width/2, height/2);
      pantalla=1;
      //noLoop();
    } else if (win) {
      int player = (nPlays+1)%2 +1;
      txt = "Player "+ player + " won";
      pantalla = 1;
      println("win "+ player);
      //noLoop();
    }
  } else if (pantalla==1) {
    background(255, 50, 50);
    fill(0);
    textAlign(CENTER);
    textSize(48);
    text(txt, width/2, height/2);
  }
}

void mousePressed() {
  checkTable();
}
