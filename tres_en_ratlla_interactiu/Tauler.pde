void createTable() {
  t = new Casella[3][3];
  for (int f =0; f<t.length; f++) {
    for (int c = 0; c<t[f].length; c++) {
      t[f][c] = new Casella(f, c, (width/3)*c, (height/3)*f, width/3);
    }
  }
}


void drawTable() {
  for (int f =0; f<t.length; f++) {
    for (int c =0; c<t[f].length; c++) {
      t[f][c].display();
    }
  }
}


void checkTable() {
  for (int f = 0; f<t.length; f++) {
    for (int c = 0; c<t[f].length; c++) {
      if (t[f][c].inside(mouseX, mouseY) && t[f][c].value==0) {
        t[f][c].setValue(nPlays%2+1);
        nPlays++;
      }
    }
  }
}

boolean winRow(int f) {
  return t[f][0].value == t[f][1].value &&
    t[f][1].value == t[f][2].value &&
    t[f][0].value != 0;
}
/*
boolean winRows2() {
 return winRow(0) || winRow(1) ||winRow(2);
 }
 */

boolean winCol(int c) {
  return t[0][c].value == t[1][c].value &&
    t[1][c].value == t[2][c].value &&
    t[0][c].value != 0;
}

boolean winCols() {
  boolean b = false;
  for (int c = 0; c<t.length; c++) {
    b = b|| winCol(c);
  }
  return b;
}

boolean winDescendentDiagV1() {
  return t[0][0].value == t[1][1].value &&
    t[1][1].value == t[2][2].value &&
    t[0][0].value != 0;
}

boolean winDescendentDiag() {
  boolean b = true;
  for(int d=0; d<t.length-1; d++){
    b = b && (t[d][d].value==t[d+1][d+1].value);
  }
  return b && t[0][0].value!=0;
}


boolean winAscendentDiag() {

  boolean b = true;
 
  for(int d=0, c= 0, f=t.length-1; d<t.length-1; d++, f--, c++){
    b = b && (t[f][c].value==t[f-1][c+1].value);
  }
  return b && t[t.length-1][0].value!=0;
}


boolean winRows() {
  boolean b = false;

  for (int f=0; f<t.length; f++) {
    b = b||winRow(f);
  }

  return b;
}
