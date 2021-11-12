PImage[] img;
int nFotogramas = 44;
int f = 1;
boolean vid = true;

void setup() {
  size(1200, 700);
  img = new PImage [nFotogramas] ;
  
  for(int i=1; i<img.length; i++){
    img[i-1] = loadImage("fotograma"+i+".jpg");
  }
}

void draw() {
  if (frameCount%5==0 && vid) {
    image(img[f], 0, 0);
    f++;
  }
  if (f==nFotogramas) {
    vid = false;
  } 
  
}
