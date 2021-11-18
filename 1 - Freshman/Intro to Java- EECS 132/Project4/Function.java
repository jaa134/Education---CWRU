/**
 * A class that will represent a relationship or expression involving one or more variables.
 * @author Jacob Alspaw
 */
public class Function {
  
  /**
   * "name" is the name of the function.
   */
  private String name;
  
  /**
   * "functionBody" is the body of the function. Is a statement.
   */
  private Statement functionBody;
  
  /**
   * "variable" is a Variable array that stores the variables of the Function.
   */
  private Variable[] variable;
  
  /**
   * A constructor method that will initialize the fields.
   * @param name Is the name of the function.
   * @param functionBody Is the statement of the function.
   * @param variable Is the Variable array that stores the variables of the function.
   */
  public Function(String name, Statement functionBody, Variable... variable) {
    this.name = name;
    this.functionBody = functionBody;
    this.variable = variable;
  }
  
  /**
   * A getter method for the Variable array.
   * @return variable Is the Variable array.
   */
  public Variable[] getVariable() {
    return variable;
  }
  
  /**
   * A getter method for the function name.
   * @return name Is the name of the function.
   */
  public String getName() {
    return name;
  }
  
  /**
   * A getter method for the function body.
   * @return functionBody Is the statement within the function.
   */
  public Statement getFunctionBody() {
    return functionBody;
  }
  
  /**
   * A method that will convert the function to a string.
   */
  public String toString() {
    StringBuilder newString = new StringBuilder(); //is the returned string for the function 
    newString.append("function " + getName() + "(" );
    //runs through the entire Variable array to make the new string
    for(int i = 0; i < variable.length; i++) {
      newString.append(variable[i].toString());
      if(i != variable.length -1) {     //if the loop isn't at the end of the array, then add another comma
        newString.append(", ");
      }
    }
    newString.append((")" + "\n" + functionBody.toStringTabbed(1)));
    return newString.toString();
  }
} 