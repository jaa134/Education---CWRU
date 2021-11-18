/**
 * A class that will represent six common comparison operations.
 * @author Jacob Alspaw
 */ 
public class Comparison implements Condition {
  
  /**
   * An enum for six common comparision operations.
   */ 
  public enum Operator {LT, LTE, GT, GTE, EQ, NEQ;}  //less than, less than or equal, greater than, greater than or equal, equals, does not equal
  
  /**
   * A field for operations from the comparison enum. 
   */ 
  private Operator opperation;
  
  /**
   * "leftOpperand represents the leftOpperand expresion used in comparison.
   */ 
  private Expression leftOpperand;
  
  /**
   * "rightOpperand" represents the rightOpperand expression used in comparison.
   */ 
  private Expression rightOpperand;
  
  /**
   * A constructor that will initialize the fields.
   * @param opperation Is a certain basic comparison.
   * @param left Is the leftOpperand expresion used in comparison.
   * @param right Is the rightOpperand expression used in comparison.
   */ 
  public Comparison (Operator opperation, Expression left, Expression right) {
    this.opperation = opperation;
    this.leftOpperand = left;
    this.rightOpperand = right;
  }
  
  /**
   * This method returns the value of a variable in a hashtable given a name.
   * @param hashState Represents a State variable and the hashTable it contains.
   */ 
  public boolean value(State hashState) {
    if(opperation == Operator.LT) {                                           //if the opperation is "is less than"
      return (leftOpperand.value(hashState) < rightOpperand.value(hashState));
    }
    else if(opperation == Operator.LTE) {                                      //if the opperation is "is less than or equal to"
      return (leftOpperand.value(hashState) <= rightOpperand.value(hashState));
    }
    else if(opperation == Operator.GT) {                                      //if the opperation is "is greater than"
      return (leftOpperand.value(hashState) > rightOpperand.value(hashState));
    }
    else if(opperation == Operator.GTE) {                                      //if the opperation is "is greater than or equal to"
      return (leftOpperand.value(hashState) >= rightOpperand.value(hashState));
    }
    else if(opperation == Operator.EQ) {                                       //if the opperation is "is equal to"
      return (leftOpperand.value(hashState) == rightOpperand.value(hashState));
    }
    else {                                                                     //if the opperation is "does not equal"
      return (leftOpperand.value(hashState) != rightOpperand.value(hashState));
    }
  }
  
  /**
   * A method that will return the name of a variable.
   * @return variableName Is a string representing the name of a variable.
   */ 
  public String toString() {
    if(opperation == Operator.LT) {                                                     //if the opperation is "is less than"
      return ((leftOpperand.toString()) + " < " + (rightOpperand.toString()));
    }
    else if(opperation == Operator.LTE) {                                                //if the opperation is "is less than or equal to"
      return ((leftOpperand.toString()) + " <= " + (rightOpperand.toString()));
    }
    else if(opperation == Operator.GT) {                                                //if the opperation is "is greater than"
      return ((leftOpperand.toString()) + " > " + (rightOpperand.toString()));
    }
    else if(opperation == Operator.GTE) {                                                //if the opperation is "is greater than or equal to"
      return ((leftOpperand.toString()) + " >= " + (rightOpperand.toString()));
    }
    else if(opperation == Operator.EQ) {                                                //if the opperation is "is equal to"
      return ((leftOpperand.toString()) + " = " + (rightOpperand.toString()));
    }
    else {                                                                               //if the opperation is "does not equal"
      return ((leftOpperand.toString()) + " != " + (rightOpperand.toString()));
    }  
  }
}
