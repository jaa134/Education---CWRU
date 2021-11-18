import java.util.Iterator;

/**
 * A class that will represent the application of our abstract data type of double-floating-point numbers.
 * @author Jacob Alspaw
 */
public class NumListDemo {
  
  /**
   * A method that will produce the mean value of a sequence. The worst case running time for this method
   * is one iteration through the list. In terms of big O, it's O(n).
   * @param lst Is the list that will be transversed and averaged.
   * @return double Is the average value for the list.
   */
  public static double meanSequence(NumList lst) {
    //variable for the sum of the nnumbers in the sequence
    double sum = 0;
    //creating my iterator
    Iterator<Double> itr = lst.iterator();
    //loop to sum each value
    while(itr.hasNext()) {
      //amounting the sum
      sum += itr.next();
    }
    //mean = sum/size
    return sum/lst.size();
  }
  
  public static void main(String[] args){
    NumArrayList listArray = new NumArrayList();
    for(int i = 0; i < 10001; i++) {
      listArray.insert(i, (double)i);
    }
    System.out.println(NumListDemo.meanSequence(listArray));
    NumLinkedList listLinked = new NumLinkedList();
    for(int i = 0; i < 10001; i++) {
      listLinked.insert(i, (double)i);
    }
    System.out.println(NumListDemo.meanSequence(listLinked));
  }
  
}