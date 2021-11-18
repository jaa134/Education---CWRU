/**
 * A class that will act as the parent class to the Comparison and BooleanOperation classes.
 * @author Jacob Alspaw
 */ 

public interface Condition {
  
  /**
   * A method that will return the value of a variable in a hashtable given a name.
   * @param hashState Represents a State variable and the hashTable it contains.
   * @return boolean Is the representation of a boolean value for a certain value.
   */ 
  public boolean value(State hashState);
  
  /**
   * A method that will return the variable name of a variable as a string.
   */ 
  public String toString();
}