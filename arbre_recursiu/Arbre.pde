class Arbre{
    Node arrel;

    Arbre(){
        this.arrel = null;
    }

    boolean isEmpty(){
        return this.arrel == null;
    }

    void addElement(int n){
        if(isEmpty()){
            this.arrel = new Node (n);
        } else{
            Node pare = this.arrel;
            while ((pare.esq != null&& n<pare.num) || (pare.dret != null && n>pare.num) || (pare.num==n)){
                if(n<pare.num){
                    pare = pare.esq;
                } else if (n>pare.num){
                    pare = pare.dret;
                }
            }
            if(n<pare.num){
                pare.esq = new Node (n);
            }else if (n>pare.num){
                pare.dret= new Node (n);
            }
        }
    }

    void display(Node n, float x, float y,float r,int lvl){
        float dx = (width/3)/(lvl+2);
        n.display(x, y,r, lvl);
        if(n.esq != null){ display(n.esq,x-dx, y+100, r, lvl+1);}
        if(n.dret != null){display(n.dret,x+dx, y+100, r, lvl+1);}
    }

    int getMinim(){
        Node pare = this.arrel;
        while(pare.esq!=null){
            pare = pare.esq;
        }
        return pare.num;
    }

    int getMaxim(){
        Node pare = this.arrel;
        while(pare.dret!=null){
            pare = pare.esq;
        }
        return pare.num;
    }
    
}