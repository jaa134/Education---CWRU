/**
 * This class will act as an expression of variables and numbers.
 * It will store the names and value of variables.
 * @author Jacob Alspaw
 */
public interface Expression {
  
  /**
   * This method returns the value of a variable in a hashtable given a name.
   * @param hashState Represents a State variable and the hashTable it contains.
   * @return value Represents a value of type boolean or integer for a variable.
   */ 
  public int value(State hashState);
  
  /**
   * This method returns the String name associated with the variable
   */ 
  public String toString();
}  