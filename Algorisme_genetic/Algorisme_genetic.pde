float wItem,hItem;

Color c;
int numColors = 8;
int generacio = 0;
Color [] poblacio;
Color desti;
boolean acaba;

void setup(){
    size(1600, 1000);
    init(numColors);
    desti = new Color(255, 255, 0);
}

void draw(){
    //avalua();
        if(!acabar){
        //selecciona();
        //creua();
        //muta();
        }
    display();
}

void init(int num){
    poblacio = new Color[num];
    for(int i=0; i<num; i++){
        poblacio[i]= new Color();
    }
    wItem = (width-10)/(float)num;
    hItem = 80;
}

void displayColors(Color[] array, float y){
    for(int i=0; i<array.length; i++){
        float x = i* wItem + 5 + wItem/2;
        array[i].display(x, y+ hItem/2,wItem,hItem);
    }
}

void display(){
    background(200);
    
    pushStyle();
        fill(0);
        textAlign(CENTER);
        textSize(30);
        text("Generació "+ generacio, width/2, 30);
        displayColors(poblacio, 50);
    popStyle();
}
void keyPressed(){
    if(keyCode== RIGHT){
        generacio++;
    }
}

void avalua(){

}

void selecciona(){

}

void creua(){

}

void muta(){

}