int [] A  = {25, 8, 5, 1, 9, 12};

void setup(){
    println("Array abans d'ordenar:");
    println (A);
    mergeSort(A, 0, 5);
    println("Array després d'ordenar:");
    println(A);
}
void swap(int[] A, int i, int j){
    int temp = A[i];
    A[i]= A[j];
    A[j]= temp;
}
void insertionSort (int [] A){
    for(int k=1; k<A.length; k++){
        int temp = A[k];
        int j = k - 1;
        while(j>=0 && temp <=A[j]) {
            A[j+1] = A [j];
            j--;
        }
        A[j+1] = temp;
    }
}
void selectionSort(int [] A){
    for(int i=0; i<A.length; i++){
        int j = smallest(A, i);
        swap(A, i,j);
    }
}

int smallest(int [] A, int i){
    int small;
    int pos;
    pos = i;
    small = A [i];
    for(int j=i+1; j<A.length; i++){
        if(A[j]<small){
            small = A[j];
            pos = j;
        }
    }
    return pos;
}

// b de beggining
// e de end
void mergeSort(int [] A, int b, int e){
    if(b<e){
        int m =(b + e)/2;
        mergeSort(A, b, m);
        mergeSort(A, m+1, e);
        merge(A, b, m, e);
    }
}

void merge(int[] A, int b, int m, int e){
  
  int i = b;
  int j = m + 1;
  int index = b;
  int k;
  
  int[] temp = new int[A.length];
  
  while(i<=m && j<=e){  
    if(A[i]<A[j]){  
      temp[index] = A[i];  
      i = i+1;  
    } 
    else {  
       temp[index] = A[j];  
       j = j+1;   
     }  
     index++;  
    }
    
    if(i>m){  
       while(j<=e){  
         temp[index] = A[j];  
         index++;  
         j++;  
       }  
    }  
    else   {  
        while(i<=m){  
            temp[index] = A[i];  
            index++;  
            i++;  
        }  
    }  
    k = b;  
    while(k<index)  {  
        A[k]=temp[k];  
        k++;  
    }  
}

int cercaBinaria (int A, int b, int t, int v){
    while(b<=t){
        int m= (b+t)/2;
        if(A[m]==v){
            return m;
        }
        else if(A[m]>v){
            t = m-1;
        } else if(A[m]<v){
            b = m+1;
        }
    }
    return -1;
}
int cercaBinariaRec (int A, int b, int t, int v){
    if(b<=t){
        int m= (b+t)/2;
        if(A[m]==v){
            return m;
        }
        else if(A[m]>v){
            return cercaBinariaRec(A, b, m-1, v);
        } else if(A[m]<v){
            return cercaBinariaRec(A, m+1, b, v);
        }
    }
    return -1;
}