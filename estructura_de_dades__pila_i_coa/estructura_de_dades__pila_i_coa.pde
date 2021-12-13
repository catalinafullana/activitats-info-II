Pila p;
int lastPopped = -1;
int lastPushed = -1;

void setup() {
    size(800,800);
    p =  new Pila();
}
void draw() {
    background(255);
    p.display(100,50);

    text("num. Elements: "+ p.quantity(), 400, 200);
    text("Empty: "+ p.isEmpty(), 400, 250);
    text("Full: "+ p.quantity(), 400, 300);
    text("Last in: "+ lastPopped, 400, 200);
    text("Last pushed: "+ lastPushed, 400, 400);
}
void keyPressed(){
    if(key=='a'|| key=='A'){
        lastPushed = (int) random(100);
        p.push(lastPushed);
        printArray(p.array);
    }
    else if(key=='b'|| key=='B'){
        
        lastPopped = p.pop();
        printArray(p.array);
    }
}