/**
 * A class that represents a function that passes control to a statement.
 * @author Jacob Alspaw
 */
public class FunctionCall implements Expression {
  
  /**
   * "function" is a relationship or expression involving one or more variables.
   */
  private Function function;
  
  /**
   * "expression" is an array of Expression and stores the many expressions for the function.
   */
  private Expression[] expression;
  
  /**
   * A constructor method that will initialize all fields.
   * @param function Is a relationship involving the variables.
   * @param expression Is an erray holding the expressions.
   */
  public FunctionCall(Function function, Expression... expression) {
    this.function = function;
    this.expression = expression;
  }
  
  /**
   * A getter method for function.
   * @return function Is a relationship involving the variables.
   */
  public Function getFunction() {
    return function;
  }
  
  /**
   * A method that will take the value of one State variable and update the value for a new State 
   * variable with the value of the old variable.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public int value(State hashState) {    
    State newState = new State();    //is a new State where values will be added to a hashTable
    //will run through the array to get the expression's values and then copy them into another State
    for(int i = 0; i < expression.length; i++) {
      newState.update(function.getVariable()[i].toString(), expression[i].value(hashState));
    }
    function.getFunctionBody().execute(newState);
    return newState.lookup("return");
  }
  
  /**
   * A method that will take the FunctionCall and represent it as a string.
   */
  public String toString() {    
  StringBuilder newString = new StringBuilder();  //the returned string denotating the FunctionCall
  newString.append(getFunction().getName() + "(" ); 
  //runs through the array of Expressions
  for(int i = 0; i < expression.length; i++) {
    if(i == expression.length - 1) {             //if the loop is at the last part of the array
      newString.append(expression[i].toString());
    }
    else{                                       //if the loop is at the any part but the part of the array
      newString.append(expression[i].toString() + "," + " ");
    }
  }  
  newString.append(")");
  return newString.toString();
  }
} 