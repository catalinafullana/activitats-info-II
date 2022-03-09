int numColors = 20;
int generacio = 0;
int numSelecs = 5;

float taxaMutacio = 0.75;

Color[] poblacio;
Color[] childhood;
Color[] millors;
Color[] creuats;

float[] avaluacio;
int[] posMillors;
boolean[] mutats;

float wItem, hItem;
boolean acabar = false;
Color desti;

void setup() {
  size(1600, 900);
  desti = new Color(255, 255, 0);
  init(numColors);
}

void draw() {
  background(255);
  avalua();

  if (!acaba()) {
    selecciona();
    creua();
    muta();
  }
  display();
  noLoop();
}


void init(int num) {
  poblacio = new Color[num];
  for (int i=0; i<poblacio.length; i++) {
    poblacio[i] = new Color();
  }

  wItem = (width - 10) / (float)poblacio.length;
  hItem = 80;

  childhood = new Color[num];
}


void avalua() {
  avaluacio = new float[poblacio.length];
  for (int i=0; i<avaluacio.length; i++) {
    avaluacio[i] = poblacio[i].distance(desti);
  }
}

void selecciona() {
  posMillors = posicioMillors(numSelecs);
  millors = new Color[numSelecs];
  for (int i=0; i<millors.length; i++) {
    millors[i] = poblacio[posMillors[i]];
  }
}

void creua() {
  creuats = new Color[poblacio.length];
  for (int i=0; i<creuats.length; i++) {
    Color c1 = millors[i%millors.length];
    Color c2 = millors[(i+1)%millors.length];
    creuats[i] = c1.creua(c2);
  }
}

void muta() {
  mutats = new boolean[poblacio.length];
  childhood = new Color[poblacio.length];
  for (int i=0; i<poblacio.length; i++) {
    float r = random(1);
    if (r<taxaMutacio) {
      mutats[i] = true;
      childhood[i] = creuats[i].muta();
    } else {
      mutats[i] = false;
      childhood[i] = creuats[i];
    }
  }
}

boolean acaba() {
  int posMillor = posicioMillor();
  acabar = avaluacio[posMillor]<5;
  return acabar;
}

int posicioMillor() {
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for (int i=0; i<avaluacio.length; i++) {
    if (avaluacio[i] < bestAval) {
      bestAval = avaluacio[i];
      bestPos = i;
    }
  }
  return bestPos;
}

int posicioMillor(int[] exclou) {
  float bestAval = Float.MAX_VALUE;
  int bestPos = -1;
  for (int i=0; i<avaluacio.length; i++) {
    if (avaluacio[i] < bestAval && 
      !hiEs(i, exclou)) {
      bestAval = avaluacio[i];
      bestPos = i;
    }
  }
  return bestPos;
}

int[] posicioMillors(int n) {

  int[] posicions = new int[n];
  for (int i=0; i<n; i++) {
    posicions[i] = -1;
  }

  for (int t=0; t<n; t++) {
    int p = posicioMillor(posicions);
    posicions[t] = p;
  }

  return posicions;
}

boolean hiEs(int value, int[] array) {
  for (int i=0; i<array.length; i++) {
    if (array[i]==value) {
      return true;
    }
  }
  return false;
}

void display() {
  fill(0); textSize(44); textAlign(CENTER);
  text("GENERACIÓ "+generacio, width/2, 60);
  displayColors(poblacio, 80);
  
  textSize(18);
  text("Avaluació", width/2, 182);
  displayAvaluacio(185);
  
  text("Selecció", width/2, 285);
  displayMillors(288);
  
  text("Creuament", width/2, 385);
  displayColors(creuats, 390);
  
  text("Mutació ("+taxaMutacio+")", width/2, 495);
  displayMutats(500);
  
  text("Descendents", width/2, 605);
  displayColors(childhood, 610);

}

void displayColors(Color[] array, float y) {
  for (int i=0; i<array.length; i++) {
    array[i].display(i*wItem + 5 + wItem/2, y + hItem/2, wItem, hItem);
  }
}

void displayAvaluacio(float y) {
  for (int i=0; i<avaluacio.length; i++) {
    pushStyle();
    rectMode(CORNER); fill(255);
    rect(i*wItem + 5, y, wItem, hItem);
    textAlign(CENTER); fill(0); textSize(12);
    text(avaluacio[i], i*wItem + 5 + wItem/2, y + hItem/2);
    popStyle();
  }
}

void displayMillors(float y) {
  for (int i=0; i<millors.length; i++) {
    pushStyle();
    Color c = millors[i];
    float n = (float)posMillors[i];
    fill(c.getColor()); rectMode(CORNER);
    rect(n*wItem + 5, y, wItem, hItem);
    popStyle();
  }
}

void displayMutats(float y) {
  for (int i=0; i<mutats.length-1; i++) {
    pushStyle();
    color c = mutats[i] ? color(255, 0, 0) : color(255);
    fill(c); rectMode(CORNER);
    rect(i*wItem + 5, y, wItem, hItem);
    popStyle();
  }
}

void setNextGen(){
    for(int i=0; i<poblacio.length;i++){
        poblacio[i]=childhood[i];
    }
}


void keyPressed() {
  if (keyCode==RIGHT) {
      if(!acabar){
        init(numColors);
        setNextGen();
        generacio++;
        loop();
      }
  }
}