/**
 * A class for variables in this basic coding language.
 * @author Jacob Alspaw
 */
public class Variable implements Expression {
  
  private String variableName;
  
  /**
   * A constructor so the variable name can refer to the parent class.
   * @param variableName Is a string that represents the name of the variable.
   */
  public Variable(String variableName) {
    this.variableName = variableName;
  }
  
  /**
   * A method that will return the value of a variable in a hashtable as an integer.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public int value(State hashState) {
    return hashState.lookup(variableName);
  }
  
  /**
   * A method that will return the name associated with the variable as a String.
   * @return variableName Is a string that represents the name of the variable.
   */
  public String toString() {
    return variableName;
  }
}