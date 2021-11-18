/**
 * A class that represents the 2 basic boolean opperators.
 * @author Jacob Alspaw
 */
public class BooleanOperation implements Condition {
  
  /**
   * An enum for two common boolean operations.
   */ 
  public enum Operator {And, Or;}    //&& and ||
  
  /**
   * A field for operations from the comparison enum. 
   */ 
  private Operator opperation;
  
  /**
   * "leftOpperand represents the leftOpperand expresion used in comparison.
   */ 
  private Condition leftOpperand;
  
  /**
   * "rightOpperand" represents the rightOpperand expression used in comparison.
   */ 
  private Condition rightOpperand;
  
  /**
   * A constructor that will initialize the fields.
   * @param opperation Is a certain basic comparison.
   * @param left Is the leftOpperand expresion used in comparison.
   * @param right Is the rightOpperand expression used in comparison.
   */ 
  public BooleanOperation (Operator opperation, Condition left, Condition right) {
    this.opperation = opperation;
    this.leftOpperand = left;
    this.rightOpperand = right;
  }
  
  /**
   * A method that will return the boolean of a variable in a hashtable as an integer.
   * @param hashState Represents a State variable and the hashTable it contains.
   */ 
  public boolean value(State hashState) {
    if(opperation == Operator.And) {                                            //if the oppertion is &&
      return (leftOpperand.value(hashState) && rightOpperand.value(hashState));
    }
    else {                                                                     //if the opperation is ||
      return (leftOpperand.value(hashState) || rightOpperand.value(hashState));
    }   
  }
  
  /**
   * A method that will return the name of a variable.
   * @return variableName Is a string representing the name of a variable.
   */ 
  public String toString() {
    if(opperation == Operator.And) {                                                  //if the opperation is &&
      return (leftOpperand.toString() + " && " + rightOpperand.toString());
    }
    else {                                                                           //if the opperation is ||
      return (leftOpperand.toString() + " || " + rightOpperand.toString());
    }
  }
}