/**
 * A class that will store all methods used for quick sort.
 * @author Jacob Alspaw
 */
public class Quick {
  
  /**
   * A method that will find a good value for the pivot by taking a value of two input elements.
   * @param array The array who will have the pivot.
   * @param x The first location in the array.
   * @param y The second location int the array.
   * @return int The value fo the pivot.
   */
  private static int findPivot(int[] array, int x, int y) {
    //pointer is the average of the two values
    return (array[x] + array[y])/2;
  }
  
  
  /**
   * A method that will partition an array, using the pointer method defined in class.
   * This method will split arrays down and sort by parts.
   * @param array The array that will be partitioned.
   * @param start The starting position of the partition.
   * @param end The ending position of the partition.
   * @return int The location where the array wil be split.
   */
  public static int partition(int[] array, int start, int end) {
    //find the pivot
    int pivot = findPivot(array, start, end);
    //pointer starting from left, one position before the array   
    int x = start - 1; //start here due to loop
    //pointer starting from right, one position after the array
    int y = end + 1; //start here due to loop
    //this loop should always happen. It'll end when our left pointer crosses our right, and the position will increment
    while (true) {
      do {
        //keep incrementing x until  we find a value that is larger than our pivot
        x++;
      } while (array[x] < pivot);
      do {
        //keep decrementing y until we find a value that is smaller than our pivot
        y--;
      } while (array[y] > pivot);
      if (x < y) {
        //swap these values if y and x pointers haven't crossed
        Sorting.swap(array, x, y);
      }
      else {
        //return where the array will be split
        return y;
      }
    }
  }
  
  /**
   * A method that will act solely as a recursive fnction. It has the ability to partialy sort an array.
   * @param array The array that will be used.
   * @param start The starting point of the sort.
   * @param end The ending point of the sort.
   * @return array An array that is partially sorted.
   */
  public static int[]  myQuickSort(int[] array, int start, int end) {
    //if the sorting length is not one
    if(end - start >= 1) {
      //partition the array
      int y = Quick.partition(array, start, end);
      //sort the left partition
      myQuickSort(array, start, y);
      //sort the right partition
      myQuickSort(array, y + 1, end);
    }
    return array;
  }
}