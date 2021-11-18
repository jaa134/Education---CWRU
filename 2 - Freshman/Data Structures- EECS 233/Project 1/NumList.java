/**
 * An interface that defines the methods used on the sequences.
 * @author Jacob Alspaw
 */
public interface NumList extends Iterable<Double> {
  
  /**
   * This method will return the size of the list.
   * @return int The size of the array.
   */
  public int size();
  
  /**
   * This method will insert a value into the list for the designated location.
   * @param i The location of the added item.
   * @param value The double value of the added item.
   */
  public void insert(int i, double value);
  
  /**
   * This method will remove an item from the list at the designated location.
   * @param i The location of the removed item.
   */
  public void remove(int i);
  
  /**
   * This method will return the value of an item for a designated location.
   * @param i The location of the designated item.
   * @reutrn double The value of the item.
   */
  public double lookup(int i);
}