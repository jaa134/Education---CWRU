/**
 * A class that will contain sorting methods for intger arrays.
 * @author Jacob Alspaw
 */
public class Sorting {
  
  /**
   * A method that will utilize the heap sort algorithm to sort an array of integers.
   * @param array The array to be sorted.
   * @return long The difference in time from start to finish.
   */
  public static long heapSort(int[] array) {
    //check for already sorted arrays will return a time of zero
    if (array == null || array.length < 2) {
      return 0;
    }
    //Starting the watch
    long startWatch = System.nanoTime();
    //creating a new heap
    Heap heap = new Heap(array);
    //creating a temporary array to hold variables
    int[] temp = new int[array.length];
    //for loop to further sort heap
    for(int i = 0; i < array.length; i++) {
      //reducing the heap size because removinf elements
      heap.setSize(heap.getSize() - 1);
      //removing top because after sifting it will be next smallest value
      temp[i] = heap.removeMin(array);
    }
    //copying temp array into permanent array
    Heap.replace(array, temp);
    //Stopping the watch
    long stopWatch = System.nanoTime();
    return stopWatch-startWatch;
  }
  
  /**
   * A method that will sort an array using an advanced method of sorting an arrray by using a pivot point.
   * @param array The array to be sorted.
   * @return long The difference in time from start to finish.
   */
  public static long quickSort(int[] array) {
    //check for already sorted arrays will return a time of zero
    if (array == null || array.length < 2) {
      return 0;
    }
    //Starting the watch
    long startWatch = System.nanoTime();
    Quick.myQuickSort(array, 0, array.length - 1);
    //Stopping the watch
    long stopWatch = System.nanoTime();
    return stopWatch-startWatch;
  }
    
  /**
   * A method that will sort an integer array using the merge sort algorithm.
   * @param array The array that will be sorted.
   * @return long The difference in time from start to finish.
   */
  public static long mergeSort(int[] array) {
    //check for already sorted arrays will return a time of zero
    if (array == null || array.length < 2) {
      return 0;
    }
    //Starting the watch
    long startWatch = System.nanoTime();
    //make a copy of the array in length
    int[] copy = new int[array.length];
    //int to determine which merge to use
    int count = 1;
    //to make sure it does the last sort
    boolean truth = false;
    //loop to size arrays. size is the length of the sub-array
    for (int size = 1; size < array.length || truth; size *= 2) {
      //loop to find locations of sub-arrays in arrays and then merge
      for (int k = 0; k < array.length; k += 2 * size) {
        if(count % 2 == 1) {
          //merge into the copy because otherwise values will be lost
          Merge.merge(array, copy, k, k + size, k + 2 * size);
          truth = true;
        }
        else {
          //then merge back
          Merge.merge(copy, array, k, k + size, k + 2 * size);
          truth = false;
        }
      }
      count++;
    }
    //Stopping the watch
    long stopWatch = System.nanoTime();
    return stopWatch-startWatch;
  }
  
  /**
   * A general helper method that will swap the value of two psotions in an array.
   * @param array The array it will happen on.
   * @param x The first position.
   * @param y The second position.
   */
  public static void swap(int[] array, int x, int y) {
    //need a temporary place holder to save data
    int save = array[x];
    array[x] = array[y];
    array[y] = save;
  }    
}