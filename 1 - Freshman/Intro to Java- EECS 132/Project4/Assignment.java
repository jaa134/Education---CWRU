/**
 * A class that represents assignment("=") of variables.
 * @author Jacob Alspaw
 */ 
public class Assignment implements Statement {
  
  /**
   * "variable" represents a variable that will be assigned a value.
   */ 
  private Variable variable;
  
  /**
   * "expression" represents the value which will be assigned.
   */ 
  private Expression expression;
  
  /**
   * A constructor method that initializes all fields.
   * @param variable Is a variable that will be assigned a value.
   * @param expression Is the value which will be assigned.
   */ 
  public Assignment(Variable variable, Expression expression) {
    this.variable = variable;
    this.expression = expression;
  }
  
  /**
   * A method that will update the hashTable with the value of "expression" in "variable"'s location.
   * @param hashState Represents a State variable and the hashTable it contains.
   */ 
  public void execute(State hashState) {
    hashState.update(variable.toString(), expression.value(hashState));
  }
  
  /**
   * A method that will return the name of a variable.
   */ 
  public String toString(){
    return (variable.toString() + " := " + expression.toString() + ";" + "\n" );  
  }
  
  /**
   * A method that returns the same string as toString(), but this method will
   * also add in a set of indentations equal to the amount declared by the user.
   * @param indents Is an integer that represents the wanted number of iindentations.
   */
  public String toStringTabbed(int indents) {
    StringBuilder newTabString = new StringBuilder();     //is the new string output for the assignment
    //Adds the declared number of indentations before the toString() part
    for(int i = 0; i < indents; i++) {
      newTabString.append("\t");
    }
    newTabString.append(variable.toString() + " := " + expression.toString() + ";");
    return newTabString.toString();
  }
}