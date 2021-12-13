class Pila  {

    int[] array;
    int top = -1;

    Pila () {
        array = new int[10];
        
    }

    void push(int n){
        if(!isFull()){
            top++;
            array[top] = n;
        }
    }

    Integer pop(){
        if(!isEmpty()){
            int temp = array[top];
            top--;
            return temp;
        } else{
            return null;
        }
    }

    boolean isEmpty(){
        return top==-1;
    }

    int quantity(){
        return top+1;
    }

    boolean isFull(){
        return top==array.length-1;
    }

    void display(int x, int y){
        pushStyle();
            float r = 70;

            for(int i = array.length-1; i>=0; i--){
                fill(0);
                text(i, x- r/2, y+ (array.length -i-1)*r + r/2);
                fill(233,244,255);
                rect(x, y + i*r, r,r);
            }
            
            for(int i = array.length-1; i>=0; i--){
                if(i<=top){
                    fill(0);
                    text(array[i], x+r/2, y+ (array.length -i-1)*r + r/2);
                }
            }
            textSize(20);
            text("⬅️ top", x+r*2, y+ (array.length-top-1)*r + r/2);
        popStyle();

    }

}