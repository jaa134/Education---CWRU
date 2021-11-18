import java.util.*;

/**
 * A hashtable that will store words of a string.
 */
public class WordHashTable {
  
  /**
   * The array of linked lists representing our chained hashing.
   */
  private LinkedList<Node>[] table;
  
  /**
   * The total count of words in the text file
   */
  private int wordTotal;
  
  /**
   * A class that will represent nodes of the linked list.
   */
  private class Node {
     
    /**
     * The occurences of a certain word.
     */
    private int frequency = 1;
    
    /**
     * The word that appeared in the text file.
     */
    private String word;
    
    /**
     * A constructor to initialize the fields of the node.
     * @param s The word of the node.
     * @param i The frequency of the node.
     */
    public Node(String s, int i) {
      word = s;
      frequency = i;
    }
    
    /**
     * Getter method for the word.
     * @return The word of the node.
     */
    public String getWord() {
      return word;
    }
    
    /**
     * Getter method for the frequency of the node.
     * @return frequency of the node.
     */
    public int getFreq() {
      return frequency;
    }
    
    /**
     * A method that will add onto the frequency.
     */
    public void addFreq() {
      frequency++;
    }
    
    /**
     * An equals method that replaces that API object method. This will
     * compare to word to see there equality.
     * @return boolean The truth behind the equality of the two nodes.
     */
    public boolean equals(Object o) {
      //if the object isnt a node
      if(!(o instanceof Node)) {
        //equality is false
        return false;
      }
      //if the object is a node
      else {
        //change the object to a node
        Node node = (Node)o;
        //return truth of equality of word content
        return this.getWord().equals(node.getWord());
      }
    }
  }  
  
  /**
   * A constructor method for this class. This will initialize all fields.
   * @param size The intial size of our array of linked lists.
   */
  public WordHashTable(int size) {
    //setting the size
    table = (LinkedList<Node>[])new LinkedList[size];
  }
  
  /**
   * A method that will add words to the hashtable. If the word is 
   * already included in the table, then the frequency of that word will
   * be incremented.
   * @param word A word that appears in the text file.
   * @param frequency The frequency of the insertion.
   */
  public void addWord(String word, int frequency) {
    //finding the location in the hashtable the item will be placed using predefined java functions.
    int location = Math.abs(word.hashCode() % table.length);
    //if the array spot is empty
    if(table[location] == null){
      //make a new list in that location
      table[location] = new LinkedList<Node>();
      //add the word to the linked list
      table[location].add(new Node(word, frequency));
    }
    else {
      //searches for the node
      int listSpot = table[location].indexOf(new Node(word, frequency));
      //if the node is not in the linked list
      if(listSpot == -1) {
        //add the node to the list with the word and frequency
        table[location].add(new Node(word, frequency));
      }
      //if the node is in the list
      else {
        //change frequency as much as needed
        for(int i = 0; i < frequency; i++) {
          //increment the frequency
          table[location].get(listSpot).addFreq();
        }
      }
    }
    //increment over all word total
    wordTotal++;
    //if the load factor is too high
    if(getLoadFactor() >= 1) {
      //rehash the table
      rehash();
    }
  }
  
  /**
   * A method that will return the load factor on the hash table.
   * @return int A representation of the load factor. If this value is over one, the hashtable is overloaded.
   */
  public double getLoadFactor() {
    //the load factor is the total nummber of elements divided by the array length
    return ((double)wordTotal)/((double)table.length);
  }
  
  /**
   * A method that will resize the hashtable so it is not over or underloaded.
   */
  public void rehash() {
    //new hashtable so word count goes back to 0
    wordTotal = 0;
    //create a temporary copy of table
    LinkedList<Node>[] temp = table;
    //resize table to twice its original size
    table = (LinkedList<Node>[])new LinkedList[2 * temp.length];
    //going through array
    for(int i = 0; i < temp.length; i++) {
      //if the array had a list in it
      if(temp[i] != null) {
        //go through the entirety of the list
        for(int j = 0; j < temp[i].size(); j++) {
          //add the word back in
          addWord(temp[i].get(j).getWord(), temp[i].get(j).getFreq());
        }
      }
    }
  }
  
  /**
   * A method that will convert the frequencies of each word into a 
   * String representation.
   * @param table The hashtable used to count frequencies.
   * @return data The representation of all the word counts in a string.
   */
  public String makeCounts() {
    //create a new string builder to make visual of frequencies
    StringBuilder data = new StringBuilder();
    //loop to go through the array
    for(int i = 0; i < table.length; i++) {
      //if the location has a list
      if(table[i] != null) {
        //go through the entire list
        for(int j = 0; j < table[i].size(); j++) {
          //append the word and it frequency to the list
          data.append("(" + table[i].get(j).getWord() + " " + table[i].get(j).getFreq() + ")" + " ");
        }
      }
    }
    //return all frequencies
    return data.toString();
  }
  
  /**
   * A method that will find run time data about our HashTable used.
   * @return data The informatiion gathered from our HashTable.
   */
  public String getStatistics() {
    //the number of lists
    int listNum = 0;
    //go through the entire array
    for(int i = 0; i < table.length; i++) {
      //if the table has a list
      if(table[i] != null) {
        //add to the count of lists
        listNum++;
      }
    }
    //returning the statistics
    return "Word total: " + wordTotal + ", " + "HashTable size:" + " " + table.length + ", " + "Average length of collision:" + " " + ((double)wordTotal)/((double)listNum);
  }
}
