class Memoria {

  int mida;
  int freeAddress;

  int numProcessos;
  Proces[] processos;

  int numForats;
  Forat[] forats;

  Memoria(int mida) {
    this.mida = mida;
    this.numProcessos = 0;
    this.processos = new Proces[100];
    this.numForats = 0;
    this.forats = new Forat [100];
    addForat(0, mida);
    this.freeAddress = 0;
  }

  void addForat(int a, int m) {
    Forat f = new Forat(a, m);
    this.forats[this.numForats] = f;
    this.numForats++;
  }



  void swapIn(Proces p) {

    boolean swapped = false;

    for (int i=0; i<numForats; i++) {

      if (forats[i] !=null && forats[i].mida >= p.mida) {

        int espaiRestant = forats[i].mida - p.mida;
        processos[numProcessos] = p;
        processos[numProcessos].setAddress(forats[i]. address);
        numProcessos++;
        swapped = true;

        forats[i].address = forats[i].address + p.mida;
        forats[i].mida = espaiRestant;

        if (espaiRestant ==0) {
          forats[i] = null;
        }
        break;
      }
    }
    
    if (!swapped) {
      println(frameCount+" ) ERROR SWAP IN");
    }
  }




  void swapInOld(Proces p) {

    if (this.freeAddress + p.mida < this.mida) {
      processos[numProcessos] = p;
      processos[numProcessos]. setAddress(this.freeAddress);
      numProcessos++;
      this.freeAddress += p.mida;
      println(frameCount+") SWAP IN del procés "+ p.nom);
    } else {
      println(frameCount+") ERROR SWAP IN del procés "+ p.nom);
    }
    
  }




  void display() {
    
    stroke(0);
    strokeWeight(3);
    fill(240, 240, 255);
    rect(100, 100, this.mida, 300);

    fill(0);
    textSize(20);
    textAlign(LEFT);
    text("Memòria RAM", 100, 60);

    for (int i=0; i<this.numProcessos; i++) {
      if (processos [i] != null) {
        processos[i].display(100, 100, 300);
      }
    }

    for (int i=0; i<this.numForats; i++) {
      if (forats [i] != null) {
        forats[i].display(100, 100, 300);
      }
    }
    
    textAlign(LEFT);
    int a=480;
    text("Memòria total: "   + this.mida,            100, a);
    text("Memòria ocupada: " + ocupat(),             100, a+20);
    text("Lliure: "          + (this.mida-ocupat()),   100, a+(20*2));
    text("Num processos: "   + numProcessos,         100, a+(20*3));
    text("Num forats: "      + numForats,            100, a+(20*4));
  }


  int ocupat() {
    int total = 0;
    for (int i=0; i<numProcessos; i++) {
      if (processos[i]!=null) {
        total += processos[i].mida;
      }
    }
    return total;
  }

  void swapOut(Proces p) {
    for (int i=0; i<this.numProcessos; i++) {
      if (processos[i]==p) {
        processos[i]= null;
        println(frameCount+ " ) SWAP OUT del procés "+p.nom);
        addForat(p.address, p.mida);
        break;
      }
    }
  }
  
  
  int numProcessos() {
    int n=0;
    for (int i=0; i<numProcessos; i++) {
      if (processos[i]!=null) {
        n++;
      }
    }
    return n;
  }

  int numForats() {
    int n=0;
    for (int i=0; i<numForats; i++) {
      if (forats[i]!=null) {
        n++;
      }
    }
    return n;
  }
  

  int getHoleMinAddress() {
    int minAddress = this.mida;
    int num = -1;

    for (int i=0; i<numForats; i++) {
      if (forats[i]!=null&&forats[i].address<minAddress) {
        minAddress = forats[i].address;
        num = i;
      }
    }
    return num;
  }


  int getProcesMinAddress(int posterior, int midaMin) {
    int minAddress = this.mida;
    int num = -1;

    for (int i=0; i<numProcessos; i++) {
      if (processos[i]!= null &&
        processos[i].address<minAddress&&
        processos[i].address>posterior&&
        processos[i].mida<=midaMin) {
          
        minAddress = processos[i].address;
        num = i;
      }
    }
    return num;
  }


  void mouProces(Proces p, int nH) {
    Forat f = forats [nH];
    println("Movent procés " + p.nom + " al forat"+ f.address);
    int oldAddress = p.address;
    p.address = f.address;

    f.address = p.address + p.mida;
    f.mida = f.mida - p.mida;

    if (f.mida == 0) {
      forats[nH] = null;
    }
    addForat(oldAddress, p.mida);
  }
  
  
  void compactaForats(int n1, int n2) {
    println("Compacta forats "+ n1+ " i "+ n2);
    if (forats[n1].address < forats[n2].address){
      forats[n1].mida+= forats[n2].mida;
      forats[n2] = null;
    }else{
      forats[n2].mida += forats[n1].mida;
      forats[n1] = null;
    }
  }
  
  void compacta(){
    
    int minForat;
    int possible;
    
    do { 
      minForat = getHoleMinAddress();
      Forat f  = forats [minForat];
      possible = getProcesMinAddress(f.address, f.mida);
      
      if (possible != -1){
        Proces p = processos[possible];
        mouProces(p, minForat);
      }   
    } while(possible != -1);
  
  
  //compactació de forats
    boolean compactable;
    int nf1=-1, nf2=-1;
    
    do{
      compactable = false;
      
      for(int i=0; i<numForats; i++){
        for(int j=0; j<numForats; j++){
          
          if(i!=j && forats[i]!=null && forats[j]!=null){
            
            Forat f1 = forats[i];
            Forat f2 = forats[j];
            if((f1.address + f1.mida==f2.address) || (f2.address +f2.mida == f1.address)){
                compactable = true;
                nf1 = i;
                nf2 = j;
            }
          }
        }
      }
      
      if(compactable){
        compactaForats(nf1,nf2);
      }
    }while(compactable);
  }
}
