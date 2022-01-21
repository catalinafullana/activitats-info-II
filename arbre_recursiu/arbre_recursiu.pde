Arbre a;

void setup(){
    size(800, 800);
    a = new Arbre ();
    for(int i=0;i<10;i++){
        a.addElement((int)random(0,100));
    }
    a.arrel.inOrdre();
}
void draw(){
    background(255, 210, 255);
    a.display(a.arrel, width/2, 100, 50,0);
}

void mousePressed(){

    a = new Arbre ();
    for(int i=0;i<10;i++){
        a.addElement((int)random(0,100));
    }
}