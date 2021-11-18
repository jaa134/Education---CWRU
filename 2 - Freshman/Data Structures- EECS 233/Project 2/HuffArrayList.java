import java.io.*;
import java.util.*;

/**
 * A class to make a list of all nodes.
 */
public class HuffArrayList {
  
  /**
   * The frequencies of each character
   */
  public static int[] frequencies = new int[127];
  
  /**
   * The number of nodes in the list.
   */
  private int totalNodes = 0;
  
  /**
   * The array list to store nodes.
   */
  private ArrayList<Node> aList = new ArrayList<Node>();
  
  /**
   * A constructer method to initialize fields and the list.
   * @param file The name of the text file.
   */  
  public HuffArrayList(String file) {
    //store the frequencies of each char
    try {
      frequencies = HuffArrayList.findFrequencies(HuffArrayList.convertFile(file));
    }
    catch (IOException e) {
    }
    //the character with max frequency
    char storage;
    //find the total number of nodes supposedly in this list
    totalNodes = HuffArrayList.numNodes(frequencies);
    //add each node to the front of the list
    for(int i = 0; i < totalNodes; i++) {
      //increment max frequency
      storage = maxValue();
      //add a new node to the front of the list
      aList.add(0, new Node(storage, null, null, frequencies[storage]));
      //remove the data from array oce its been added
      frequencies[storage] = 0;
    }
  }
  
  /**
   * A method that will return which char has the max frequency.
   * @return char The character with the max frequency.
   */
  public char maxValue() {
    //start loaction
    int location = -1;
    //the max frequency
    int maxFreq = -1;
    //for loop to find max frequency
    for(int i = 0; i < frequencies.length; i++) {
      //if this value is larger than stored value
      if(frequencies[i] > maxFreq) {
        //change the max
        maxFreq = frequencies[i];
        //save the location of the max value
        location = i;
      }
    }
    //the location of the max value corresponds to a char value
    return (char)location;
  }
  
  /**
   * This method counts the number of nodes we should have in the list. This helper method saves time.
   * @param array The array which we will be counting.
   * @return num The number of nodes in our list.
   */
  public static int numNodes(int[] array) {
    //the number of nodes
    int num = 0;
    //loop to go through array
    for(int i = 0; i < frequencies.length; i++) {
      //if the value is not zero
      if(frequencies[i] != 0) {
        //the size of the list expands by one
        num++;
      }
    }
    return num;
  }
    
  /**
   * A method that will convert ".txt" file into a String.
   * @param file The name of the file.
   * @return String The file contents represented as a string.
   */
  public static String convertFile(String file) throws IOException {
    //creating a new buffered reader from a file reader. Chosen for speed.
    BufferedReader reader = new BufferedReader(new FileReader (file));
    //creating a new String builder to store the read characters.
    StringBuilder text = new StringBuilder();
    //reading the text file by lines
    String line = reader.readLine();
    //loop until the text file has been completly read
    while(line != null) {
      //adding the line to the new string and starting a new line
      text.append(line + "\n");
      //iterate to the next line
      line = reader.readLine();
    }
    //deleting the extra new line character at the end of the string
    text.deleteCharAt(text.length() - 1);
    //return text file as a string
    return text.toString();
  }
  
  /**
   * A method that will count frequencies of characters in a String.
   * @param file The name of the file.
   * @reutrn frequencies An array representation of character frequencies.
   */
  public static int[] findFrequencies(String text) {
    //for loop to go through all chars in the text
    for (int i = 0; i < text.length(); i++) {
      //adds to the frequency of the current char
      frequencies[(int)text.charAt(i)]++;
    }
    //return the array
    return frequencies;
  }
  
  /**
   * A getter method for the list of this array.
   * @return int The size of the list.
   */
  public ArrayList<Node> getList() {
    return aList;
  }
}