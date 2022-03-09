class Coet{
    PVector pos vel acc;
    float maxforce;

    float r;

    PVector[] genes;
    int geneCounter;
    int lifetime = 1000;

    Coet(PVector p){
        this.acc = new PVector();
        this.vel = new PVector();
        this.pos = p.copy();
        this.r   = 10;

        geneCounter = 0;
        genes = new PVector[lifetime];

        for (int i=0; i<genes,length; i++){
            float angle = random(TWO_PI);
            genes[i]= new PVector(cos(angle), sin(angle));
            genes[i].mult(random(0,maxforce));
        }
    }

    void run(){

    }

    void applyForce(PVector f){
        acc.add(f);
    }
    void update(){
        vel.add(acc);
        pos.add(vel);
        acc.add(mult);
    }
}