/**
 * A class that will represent a compound statement/block of code in the language.
 * @author Jacob Alspaw
 */
public class CompoundStatement implements Statement{
  
  /**
   * "statement" is a Statement in the form of an array in purpose of holding multiple Statement variables.
   */
  private Statement[] statement; 
  
  /**
   * A method tht initializes the Statement array.
   * @param statement Is a Statement in the form of an array in purpose of holding multiple Statement variables.
   */
  public CompoundStatement(Statement... statement) {
    this.statement = statement;
  }
  
  /**
   * A method that will update the State's hashtable with the variable name and value of the variable.
   * @param hashState Represents a State variable and the hashTable it contains.
   */
  public void execute(State hashState) {
    //goes through all elements of the Statement array to update values
    for(int i = 0; i < statement.length; i++) {
      statement[i].execute(hashState);
    }
  }
  
  /**
   * A method that will convert the compound statement to a string with indentations.
   */
  public String toString() {    
    StringBuilder newString = new StringBuilder();          //is the new string representtion of "statement"    
    newString.append("{" + "\n");
    //goes through all elements of the Statement array to make the string
    for(int i = 0; i < statement.length; i++) {
      newString.append(statement[i].toStringTabbed(1));
    }
    newString.append("\n" + "}");
    return newString.toString(); 
  }
  
  /**
   * A method that will convert the compund statement to a string with a designated amount of indentations.
   * @param indents Is the integer representation of requested indentations.
   */
  public String toStringTabbed(int indents) {    
    StringBuilder newString = new StringBuilder();          //is the new string representtion of "statement"
    //adds requested number of indentations
    for(int i = 0; i < indents - 1; i++) {
      newString.append("\t");
    }
    newString.append("{" + "\n");
    //goes through the Statement array to add the statement to the stringBuilder
    for(int i = 0; i < statement.length; i++) {
      newString.append(statement[i].toStringTabbed(indents) + "\n");
    }
    //adds requested number of indentations
    for(int i = 0; i < indents - 1; i++) {
      newString.append("\t");
    }
    newString.append("}");
    return newString.toString(); 
  }
}