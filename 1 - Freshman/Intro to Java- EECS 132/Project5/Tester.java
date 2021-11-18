import org.junit.*;
import static org.junit.Assert.*;
import java.util.*;

/**
 * A class used to test Programming Project 5.
 * @author Jacob Alspaw
 */

public class Tester{
  /**
   * The method used to test the program.
   */
  @Test
  public void projectTest(){
    //creating and adding the contacts to the database
    Database database = new Database(); //testing database
    Contact c1 = new Contact("Jacob Alspaw", "636-699-7344", "jaa134@case.edu");   //testing full and creating a contact
    Contact c2 = new Contact("Anonymous", null, null);                             //testing empty and creating a contact
    database.add(c1);  //adding to an empty databse
    database.add(c2);  //adding to a database with contacts
    
    //testing getter and setter methods of contact
    assertEquals(c1.getName(), "Jacob Alspaw");          //existing trait
    assertEquals(c2.getName(), "Anonymous");             //existing trait
    assertEquals(c1.getPhoneNumber(), "636-699-7344");   //existing trait
    assertEquals(c2.getPhoneNumber(), null);             //nonexistent trait
    assertEquals(c1.getEmail(), "jaa134@case.edu");      //existent trait
    assertEquals(c2.getEmail(), null);                   //nonexistent trait
    
    //make an index to hold all of the contacts by name
    //testing database
    database.makeIndex("name");    //for no indexes
    database.makeIndex("email");   //one index exists
    database.makeIndex("phone");   //two indexes exist
    
    //testing pulling values from and placing values into arraylists
    if(!database.lookup("name", c1).element().equals(c1)) {           //for a full list
      fail("Does not correctly look up");
    }    
    ArrayList<DatabaseType> list1 = database.getList("name");    
    if(!(list1.get(1).equals(c1) && list1.get(0).equals(c2))) {      //for a full list
      fail("Incorrectly puts values into list");
    }
    
    //testing pulling values from and placing values into arraylists
    if(!database.lookup("email", c1).element().equals(c1)) {         //for a full list
      fail("Does not correctly look up");
    }
    ArrayList<DatabaseType> list2 = database.getList("email");
    if(!(list2.get(1).equals(c2) && list2.get(0).equals(c1))) {      //for a full list
      fail("Incorrectly puts values into list");
    }
    
    //testing pulling values from and placing values into arraylists
    if(!database.lookup("phone", c1).element().equals(c1)) {        //for a full list
      fail("Does not correctly look up");
    }
    ArrayList<DatabaseType> list3 = database.getList("phone");
    if(!(list2.get(1).equals(c2) && list2.get(0).equals(c1))) {     //for a full list
      fail("Incorrectly puts values into list");
    }
    
    //testing comparison of contacts
    if(c1.equals(c2)) {                                             //testing comparison of contacts
      fail("Does not correctly compare two contacts for equality");
    }
    if(c2.equals(c1)) {                                             //testing comparison of contacts
      fail("Does not correctly compare two contacts for equality");
    }
    assertEquals(c1.equals(c1), true);    //testing equality to self and full contact
    assertEquals(c2.equals(c2), true);    //testing equality to self and null contact
    
    //testing the to string representation of the methods
    if(!c1.toString().equals("Jacob Alspaw   :   636-699-7344\tjaa134@case.edu")) {   //tests what the string will be with full values
      fail("Does not correctly represent the contact as a string");
    }
    if(!c2.toString().equals("Anonymous   :   null\tnull")) {               //tests what the string will be with empty values
      fail("Does not correctly represent the contact as a string");
    }
    
    //testing the array to see if it can correctly delete contacts from the database
    database.delete(c1);  //deleting full contact
    database.delete(c2);  //deleting null contact
    if(database.lookup("name", c1).size() != 0) {
      fail("Does not correctly delete from database");
    }
    if(database.lookup("name", c2).size() != 0) {
      fail("Does not correctly delete from database");
    }    
  }
}