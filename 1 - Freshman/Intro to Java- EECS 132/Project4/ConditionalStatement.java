/**
 * A class that represents "if-then" and "if-else" statements.
 * @author Jacob Alspaw
 */ 
public class ConditionalStatement implements Statement {
  
  /**
   * "condition" is the condition for the statement.
   */
  private Condition condition;
  
  /**
   * "thenStatement" is the aftermath of a passing "if" statement. Is a statement in itself.
   */
  private Statement ifStatement;
  
  /**
   * "elseStatement" is the proceedings of an "else" statement. Is a statement in itself.
   */
  private Statement elseStatement;
  
  /**
   * A constructor that will initialize the fields.
   * @param condition Is the condition for the statement.
   * @param thenStatement Is the aftermath of a passing "if" statement.
   * @param elseStatement Is the proceedings of an "else" statement.
   */
  public ConditionalStatement(Condition condition, Statement ifStatement, Statement elseStatement) {
    this.condition = condition;
    this.ifStatement = ifStatement;
    this.elseStatement = elseStatement;    
  }
  
  /**
   * A method that will update the State's hashtable with the variable name and value of the variable.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public void execute(State hashState) {
    if(condition.value(hashState)) {   //if the condition is true, then execute the proceeding "then" statement of the condition
      ifStatement.execute(hashState);
    }
    else {                             //otherwise, execute the proceeding "else" statement of the condition
      elseStatement.execute(hashState);
    }
  }  
  
  /**
   * A mehtod that will convert the conditional statement to a string.
   */
  public String toString() {
    return ("if" + " " + "(" + condition.toString() + ")" + "\n" + ifStatement.toStringTabbed(1) + "else" + "\n" + elseStatement.toStringTabbed(1));
  }
  
  /**
   * A method that will convert the conditional statement to a string with a requested amount of indentations.
   * @param indents Is an integer that represents the wanted number of iindentations.
   */
  public String toStringTabbed(int indents) {
    StringBuilder newString = new StringBuilder();  //is the string representation of the conditional statement as a string
    //adds the requested number of indentations
    for(int i = 0; i < indents -1; i++) {
      newString.append("\t");
    }
    newString.append("if" + " " + "(" + condition.toString() + ")" + "\n" + ifStatement.toStringTabbed(indents + 1));
    //adds the requested number of indentations
    for(int i = 0; i < indents - 1; i++ ) {
      newString.append("\t");
    }
    newString.append("else" + "\n" + elseStatement.toStringTabbed(indents + 1));
    return newString.toString();
  }
}