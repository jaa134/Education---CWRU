/**
 * A class that will store helper Methods for the mergeSorting.
 * @author Jacob Alspaw
 */
public class Merge {
  
  /**
   * A method that will merge two sub-arrays into a sorted array.
   * @param temp The array from which we are using elements.
   * @param array Int the array to which we are storing elements.
   * @param low The low value in from we start with.
   * @param middle The middle of the block we are using to seperate the two arrays we're merging.
   * @param high The last element in from to put into to.
   */ 
  public static void merge(int [] temp, int [] array, int low, int middle, int high) {
    //Covering array sizes of odd lengths. If middle is greater than the array length, then make middle the length
    if (middle > temp.length) {
      middle = temp.length;
    }
    //Covering array sizes of odd lengths. If high is greater than the array length, then make high the length
    if (high > temp.length) {
      high = temp.length;
    }
    //index for the first sub-array
    int i = low;
    //index for the second sub-array
    int j = middle;
    //loop to give every position a merge
    for (int k = low; k < high; k++) {
      //Covering for when 'i' will eventually exceed sub-array
      if (i == middle) {
        //i has been fully used and 'j' will fill the remaining values
        array[k] = temp[j];
        j++;
      }
      //Covering for when 'j' will eventually exceed sub-array
      else if (j == high) {
        //j has been fully used and 'i' will fill the remaining values
        array[k] = temp[i];
        i++;
      }
      //if the value in the 'i' sub-array is less than the value in the 'j' sub-array
      else if(temp[i] <= temp[j]) {
        //that value should be put into the merged array
        array[k] = temp[i];
        i++;
      }
      //if the value in the 'j' sub-array is less than the value in the 'i' sub-array
      else {
        //that value should be put into the merged array
        array[k] = temp[j];
        j++;
      }
    }
  }
}