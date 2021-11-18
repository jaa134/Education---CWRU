/**
 * A class that serves as a parent for all statement classes.
 * @author Jacob Alspaw
 */ 
public interface Statement {
  
  /**
   * A method that updates the state with the expression.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public void execute(State hashState);
  
  /**
   * A method that returns a String with all values involved in this class.
   */
  public String toString();
  
  /**
   * A method that returns the same string as toSting() except with the indentations.
   * @param indents Is an integer that represents the wanted number of iindentations.
   * @return String Is a string representation of the statement.
   */
  public String toStringTabbed(int indents);
}