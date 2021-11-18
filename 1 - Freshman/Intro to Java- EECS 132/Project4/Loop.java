/**
 * A class that represents a simplified loop in the program.
 * @author Jacob Alspaw
 */
public class Loop implements Statement {
  
  /**
   * "condition" is the circumstances of the loop (when and won't the loop run).
   */
  private Condition condition;
  
  /**
   * "loopBody" is the body of the loop. Comprises of statements.
   */
  private Statement loopBody;
  
  /**
   * A constructor method that initializes the fields.
   * @param condition Is the circumstances of the loop(when the loop will run).
   * @param loopBody Is the body of the loop, a number of statements.
   */
  public Loop(Condition condition, Statement loopBody) {
    this.condition = condition;
    this.loopBody = loopBody;
  }
  
  /**
   * A method that will run the loop until the condition is false.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public void execute(State hashState) {
    //a loop that will loop for the Loop type until the condition is false.
    while(condition.value(hashState)) {
      loopBody.execute(hashState);
    }
  }
  
  /**
   * A method that will convert the loop to a string.
   */
  public String toString() {
    return ("while" + " " + "(" + condition.toString() + ")" + "\n" + loopBody.toStringTabbed(1));
  }
  
  /**
   * A method that will convert the loop to a string, but with a requested amount of indentations.
   * @param indents Is an integer that represents the wanted number of iindentations.
   */
  public String toStringTabbed(int indents) {
    StringBuilder newString = new StringBuilder();    //is the output string for the loop
    //adds the requested number of indentations to the string
    for(int i = 0; i < indents; i++) {
      newString.append("\t");
    }
    newString.append("while" + " " + "(" + condition.toString() + ")" + "\n" + loopBody.toStringTabbed(indents + 1));
    return newString.toString();
  }
}