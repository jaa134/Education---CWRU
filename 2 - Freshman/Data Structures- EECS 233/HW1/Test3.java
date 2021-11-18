/*
 * A class to answer homework problem 3.
 * @author Jacob Alspaw
 */
public class Test3 {
  
  /*
   * A method that will return the greatest common denominator
   * of two integers using euclids theorem.
   * @param a The first integer.
   * @param b The second integer.
   * @return int The greatest common denominater.
   */
  public static int euclid(int a, int b) {
    if(b == 0) {
      return a;
    }
    else if(a >= b && b > 0) {
      return euclid(b, a % b);
    }
    else return euclid(a, b);
  }
}
