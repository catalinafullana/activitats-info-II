class Node{
    int num;
    Node esq, dret;

    Node(int num){
        this.num = num;
        this.esq = null;
        this.dret= null;
    }

    void setEsq(Node nf){
        this.esq = nf;
    }
    
    void setDret(Node nf){
        this.dret = nf;
    }

    void inOrdre(){
        if(this.esq != null)  {this.esq.inOrdre();}
        println(this.num);
        if(this.dret!= null) {this.dret.inOrdre();}

    }
    void preOrdre(){
        println(this.num);      
        if(this.esq != null){this.esq.preOrdre(); }
        if(this.esq != null){this.dret.preOrdre();}
    }
    void postOrdre(){
        if(this.esq != null) { this.esq.postOrdre();}
        if(this.dret != null){ this.dret.postOrdre();}
        println(this.num);
    }

    void display(float x, float y, float r,  int lvl){
        float dx = (width/3)/(lvl+2);

        pushStyle();
            if(this.esq != null){line(x,y, x-dx, y+100);}
            if(this.dret != null){line(x,y, x+dx, y+100);}
            ellipse(x, y, r, r);
            fill(0);
            textAlign(CENTER);
            textSize(18);
            text(this.num, x, y);
        popStyle();
    }
}