import java.util.*;
import java.util.Scanner;

/*
 * This class is a database that will store contacts for a certain person.
 * @author Jacob Alspaw
 */
public class ContactDatabase {
  
  /*
   * This method will take an Iterable and print the contents of the Iterable.
   * @param iterable An item that can go through the type.
   */
  public static void printList(Iterable<DatabaseType> iterable) {
    int i = 1;
    //Prints the list of contacts.
    for(DatabaseType type : iterable) {
      System.out.println(i + ". " + type.toString());
      i++;
    }
  }
  
  /*
   * This method will create a ContactDatabase and a Scanner object that reads from 
   * Standard.in. This will enable the user to initialize an interface.
   * @param args The arguments the user throws.
   */
  public static void main(String[] args) {
    Database database = new Database();                              //represents the databse to hold all contacts.
    Scanner scanner = new Scanner(System.in);                        //searches for entred items
    Iterable<DatabaseType> lastList = new ArrayList<DatabaseType>(); //for the last list entered y the user
    String input = scanner.next();                                 //for the entered trait
    //will run until the user enters quit
    while(!input.equals("quit")) {
      if(input.equals("add")) {                                    //if the user wants to add a contact
        Contact c = new Contact(scanner.next(), scanner.next(), scanner.next());
        database.add(c);
      }
      else if(input.equals("listby")) {                            //if the user wants to see ordered by trait
        String trait = scanner.next();                             //for the entered trait
        if(database.getTable().containsKey(trait)) {
          printList(lastList = database.getList(trait));
        }
        else {
          System.out.println("List does not exist!");
        }
      }
      else if(input.equals("find")) {                             //if the user wants to find a contact using a trait
        String trait = scanner.next();                            //for the entered trait
        String value = scanner.next();                            //for the entered value
        if(trait.equals("name")) {
          printList(lastList = database.lookup(trait, new Contact(value, null, null)));
        }
        else if(trait.equals("phone")) {
          printList(lastList = database.lookup(trait, new Contact(null, value, null)));
        }
        else if(trait.equals("email")) {
          printList(lastList = database.lookup(trait, new Contact(null, null, value)));
        }
      }
      else if(input.equals("delete")) {                         //if the user wants to delete an element in the most recent list
        int indexNum = Integer.parseInt(scanner.next());  //stores the entered index
        LinkedList<DatabaseType> list = new LinkedList<DatabaseType>();
        int i = 0;
        //for each databasetype in the last array list, add item to the linked list for printing
        for(DatabaseType dbt: lastList) {
          i++;
          if(i != indexNum)
            list.add(dbt);
        }
        printList(list);
      }
      else if(input.equals("makeindex")) {
        String trait = scanner.next();  //for the entered trait
        database.makeIndex(trait);
      }
      else {
        System.out.println("Not a valid command!");  
      }
      input = scanner.next();      
    }
  }
}