/*
 * A class that serves to answer homework problem 4.
 * @author Jacob Alspaw
 */
public class Test4 {
  
  /*
   * This method will reverse the order of an array of integers.
   * @param original The array to be reversed.
   */
  public static void reverse(int[] original) {
    int[] temporary = new int[original.length];
    for(int i = 0; i < original.length; i++) {
      temporary[i] = original[original.length - i - 1];
    }
    for(int i = 0; i < original.length; i++) {
      original[i] = temporary[i];
    }
  }
}
  
  