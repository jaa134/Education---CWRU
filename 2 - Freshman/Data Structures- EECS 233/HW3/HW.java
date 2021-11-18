public class HW {

  //array to store heap values
  T[] array = new T[];
  
  public void insert(T item) {
    //adds item at the end of the array
    array[size] = item;
    //increment the size so sift up includes the new value
    size++;
    //sifts the array and sorts in order of 
    array.siftUp(size);
  }
  
  public T removeMax() {
    //variable to store max value
    T variable = array[0];
    //setting the first heap value
    array[0] = array[size - 1];
    //change size for exclusion the last heap value
    size--;
    //sifting to reheapify
    array.siftDown(size);
    //max value
    reutrn variable;
  }
  
  public void siftUp(int i){
    //if we arent tryng to sift up the first node
    if(i != 0) {
      //if the parent is greater than or equal to its child
      if(array[(i - 1)/2].compareTo(array[i]) == 1 || array[(i - 1)/2].compareTo(array[i]) == 0) {
        //do nothing
      }
      //if parent is less than child
      else {
        //keep a variable to store value of parent
        T variable = array[(i - 1)/2];
        //parent equals child
        array[(i -1)/2] = array[i];
        //child equals parents value
        array[i] = variable;
        //recursively call sift up
        array.siftUp((i-1)/2);
      }
    }
  }
  
  public void siftDown(int i) {
    //if parent has two children
    if(2i + 1 < size && 2i + 2 < size) {
      //if left child is greater than right
      if(array[2i + 1].compareTo(array[2i + 2]) == 1) {
        //keep a variable to store value of left child
        T variable = array[2i + 1];
        //left child equals parent
        array[2i + 1] = array[i];
        //parent equals left child value
        array[i] = variable;
        //recursively call sift down on left child
        array.siftDown(2i + 1);
      }
      //if right child is greater than or equal to left
      else {
        //keep a variable to store value of right child
        T variable = array[2i + 2];
        //rigth child equals parent
        array[2i + 2] = array[i];
        //parent equals right child value
        array[i] = variable;
        //recursively call sift down on right child
        array.siftDown(2i + 2);
      }
    }
    //if parent has only one child (it must be a left child)
    else if(2i + 1 < size) {
      //keep a variable to store value of left child
      T variable = array[2i + 1];
      //left child equals parent
      array[2i + 1] = array[i];
      //parent equals left child value
      array[i] = variable;
      //recursively call sift down on left child
      array.siftDown(2i + 1);
    }
  }
}