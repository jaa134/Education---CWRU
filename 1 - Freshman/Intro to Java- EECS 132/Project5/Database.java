import java.util.*;
import java.util.Collections;

/**
 * Database is a class that limits the types it can store to DatabaseTypes. This
 * class will let the user create an index for the database and store data into 
 * nodes. An index is a sorted array. This is so the searches can happen quickly.
 * @author Jacob Alspaw
 */
public class Database {
  
  /*
   * A node that indicates the start of the list of nodes that store the data in
   * the database.
   */
  private LLNode<DatabaseType> front = new LLNode<DatabaseType>(null, null);
  
  /*
   * A Hashtable that uses String as the key and ArrayList as the value. The Hashtable
   * will store the different indexes available to fast sort the data.
   */
  private Hashtable<String, ArrayList<DatabaseType>> hashTable = new Hashtable<String, ArrayList<DatabaseType>>();
  
  /*
   * A LinkedList that will hold the data.
   */
  private LinkedList<DatabaseType> list = new LinkedList<DatabaseType>();
  
  /**
   * A method that will take an element and add it to the database by creating a node
   * for the data and attaching it to the list of nodes.
   */
  public void add(DatabaseType type) {
    list.add(type);
  }
  
  /*
   * This method will return the hashTable.
   */
  public Hashtable<String, ArrayList<DatabaseType>> getTable() {
    return hashTable;
  }
  
  /*
   * A method that will take an element and delete the element from the list of nodes. If the
   * element occurs more than once in the list, all copies will be deleted. If an element is 
   * changed, the hashtable is cleared.
   * @param type Is the element of the LinkedList.
   */
  public void delete(DatabaseType type) {
    int i = 0;
    for(DatabaseType x : list) {
      i += 1;
      if(x.equals(type)) {
        list.remove(i - 1);
      }
    }
  }
  
  /*
   *A method that will take a value, an ArrayList index, and a Comparator and returns a LinkedList
   * that contains all elements of the database that match the input value.
   * @param value Is the value of the trait.
   * @param c Is the comparator for the trait.
   * @return newList Is the returned list with the appropriate contacts.
   */
  public LinkedList<DatabaseType> lookupInList(DatabaseType value, Comparator<DatabaseType> c) {
    LinkedList<DatabaseType> newList = new LinkedList<DatabaseType>();  //new list to be reutrned. has the necessar components
    //for each databse type in list,  add the item to the new linked list
    for(DatabaseType x : list) {
      if(c.equals(x)) {
        newList.add(x);
      }
    }
    return newList;
  }
  
  /*
   * This method will take a value, an ArrayList index, and a Comparator to return a LinkedList
   * that contains all elements of the database that much the input value.
   * @param value Is the value of the trait.
   * @param index Is the location on the array list.
   * @param c Is the cmparator for the method.
   * @return matchedList Is the list returned that matches what is needed.
   */
  public LinkedList<DatabaseType> lookupInIndex(DatabaseType value, ArrayList<DatabaseType> index, Comparator<DatabaseType> c) {
    //start of binary search
    int start = 0;    //start of search
    int end = index.size() - 1;   //end of search
    int i = 0;                    //current spot
    int binarySearchResult = -1;  //the result of the current spot
    //will continue to search the the list until the whole list has been searched
    while(start < end && binarySearchResult == -1) {
      i = (start + end) /  2;
      //if the element is equal to the value
      if(c.compare(index.get(i), value) == 0) {
        binarySearchResult = i;
      }
      //if the element is less than the value
      if(c.compare(index.get(i), value) < 0) {
        end = i - 1;
      }
      //if the element is greater than the value
      if(c.compare(index.get(i), value) > 0) {
        start = i + 1;
      }
    }
    //returns an empty list if there is no match
    if(binarySearchResult == -1) {
      return new LinkedList<DatabaseType>();
    }
    //continue outwards for the binary searches
    int left = binarySearchResult;
    int right = binarySearchResult;
    while((left >= 0 && right < index.size() - 1) && (c.compare(index.get(left), value) == 0) || (c.compare(index.get(right), value) == 0)) {
      //if the values to the left are equal
      if(c.compare(index.get(left), value) == 0) {
        list.add(index.get(left));
      }
      //if the values to the left are equal, disregarding the right values
      if(c.compare(index.get(left), value) == 0 && left != right) {
        list.add(index.get(left));
      }
      left = left - 1;
      right = right +  1;
    }
    return list;
  }
  
  /*
   * This method will make an index as long as the database is empty.
   * @param trait Is the trait of a contact.
   */
  public void makeIndex(String trait) {
    ArrayList<DatabaseType> arrayList = new ArrayList<DatabaseType>();   //array list for the hashtable and index
    //for each databsetype in list, add it to the array list
    for(DatabaseType x : list) {
      arrayList.add(x);
    }
    Collections.sort(arrayList, list.getFirst().getComparatorByTrait(trait));
    hashTable.put(trait, arrayList);
  }
  
  /*
   * This method takes a trait and a value and will return the LinkedList returned by the methods used
   * in creation of this method.
   * @param trait Is the trait of the contact.
   * @param value Is the value of the trait.
   * @return newList Is the list that the user requests.
   */
  public LinkedList<DatabaseType> lookup(String trait, DatabaseType value) {
    if(hashTable.isEmpty() && hashTable.containsKey(trait)) {
      return this.lookupInIndex(value, hashTable.get(trait), value.getComparatorByTrait(trait));
    }
    else {
      return this.lookupInList(value, value.getComparatorByTrait(trait));
    }
  }
  
  /*
   * This method will return an index for trait if it exists in the hashtable. Otherwise, 
   * this method will make an index with the trait to create the index and return that index.
   * @param trait Is the trait of the contact.
   */
  public ArrayList<DatabaseType> getList(String trait) {
    if(hashTable.containsKey(trait)) {
      return hashTable.get(trait);
    }
    else {
      this.makeIndex(trait);
      return hashTable.get(trait);
    }
  }
}