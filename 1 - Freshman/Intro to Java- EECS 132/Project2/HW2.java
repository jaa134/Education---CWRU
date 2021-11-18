/** Jacob Alspaw
  * This Class will take a series of strings and either manipulate 
    them or analyze them for a specified and specialized purpose.*/
public class HW2 {
  
  /** 1. isAlphabeticalOrder is a method that returns true if the letters of the input are in alphabetical order, 
    * regardless of case. A character that is not a letter is ignored. The method returns false otherwise. The input 
    * type for this method is String and the return type boolean.*/
  public static boolean isAlphabeticalOrder(String isAlphabeticalOrderTest) {    
    StringBuilder noSymbolString = new StringBuilder();                                  //represents a string that is void of non letters
    int cycle = 0;
    int cycle2 = 0;
    String AOT = isAlphabeticalOrderTest;                                                //abbreviation for use of the input string
   
    while(cycle < AOT.length()) {                                                        //makes new string without symbols and in upper case letters
      if(AOT.charAt(cycle) >= 'A' && AOT.charAt(cycle) <= 'Z') {
        noSymbolString.append(AOT.charAt(cycle));        
      }
      if(AOT.charAt(cycle) >= 'a' && AOT.charAt(cycle) <= 'z') {
        noSymbolString.append((char)(AOT.charAt(cycle) - 32));        
      }
      cycle = cycle + 1;
    }
    while(cycle2 < noSymbolString.length() - 1) {                                        //tests if alphabetical by comparing values of assigned letter values
      if(noSymbolString.charAt(cycle2) > noSymbolString.charAt(cycle2 + 1)) {
        return false;       
      }
      cycle2 = cycle2 + 1;
    }
    return true;
  }
  
  /** 2. removeNchars is a method that outputs the same as the input except that the first n occurences of the input 
    * char are removed from the string, where n represents the input integer. If there are not n occurences of the 
    * input character, then all occurences of the character are removed. The inputs consist of a String to test, an
    * integer for number of cases, and a char that is removed.*/
  public static String removeNchars(String removeNcharsTest, int n, char removedCharacter) {
    StringBuilder newString = new StringBuilder();                                  //output string with the characters removed
    int cycle = 0;
    int count = 0;                                                                  //the number of times the char has been removed
    while(cycle < removeNcharsTest.length() && count < n) {                         //adds letters until the character removed is removed the designated amount of times
      if(removeNcharsTest.charAt(cycle) != removedCharacter) {
        newString.append(removeNcharsTest.charAt(cycle));
      }
      else {
        count = count + 1;
      }
      cycle = cycle + 1;
    }
    while((cycle <  removeNcharsTest.length()) && (count == n)) {                  //adds the rest of the letters, including the removed ones to the out put string as long as the removed char has been removed n times   
        newString.append(removeNcharsTest.charAt(cycle));
        cycle = cycle + 1;
      }
    return newString.toString();
  }    
  
  /** 3. moveXright is a method that outputs the same as the input except that the first occurrence of the 
    * input char is swapped with the character immediately to its right. If there is no occurrence of the input char or
    * if it is the last character of the input string, then the output will be identical to the input.*/
  public static String moveXright(char movedLetter, String moveXrightTest) {
    StringBuilder newString = new StringBuilder();                                                                             //output string that will have the designated char moved
    int cycle = 0;
    int count = 0;                                                                                                             //notes how many times the char has been moved
    while(cycle < moveXrightTest.length()) {                                                                                   //moves the designated char to the position after the next char in the cycle 
      if(((moveXrightTest.charAt(cycle) == movedLetter) && count == 0) && (cycle != moveXrightTest.length() - 1)) {
        newString.append(moveXrightTest.charAt(cycle + 1));
        newString.append(moveXrightTest.charAt(cycle));
        count = count + 1;
        cycle = cycle + 2;
      } else {
        newString.append(moveXrightTest.charAt(cycle));
        cycle = cycle + 1;
      }
    }
    return newString.toString();
  }
  
  /** 4. bracketString is a method that outputs the same as the input except every occurence of the second input should
    * be placed inside brackets []. If there is overlap, the first occurence is bracketed (ex: input 1 == "cabcabcab"; 
    * input 2 == "cabc"; output == "[cabc]abcab". The inputs are two strings and the output is also string */
  public static String bracketString(String originalString, String itemString) {
  
    StringBuilder tempString = new StringBuilder();                                  //string to compare to the segment that will be put in brackets
    StringBuilder newString = new StringBuilder();                                   //output string with brackets
    int cycle = 0;
    int count = 0;
    
    while(cycle < originalString.length() ) {                                        //tests to see if any segment in the input string matches the segment to be put in brackets
      if(originalString.charAt(cycle) != itemString.charAt(count)) {                
        newString.append(tempString);
        newString.append(originalString.charAt(cycle));
        tempString.delete(0, tempString.length());
        count = 0;
      }
      else {                                                                        //puts matching segments in brackets
        tempString.append(originalString.charAt(cycle));
        count = count + 1;
        if(tempString.toString().equals(itemString)) {
          newString.append("[" + tempString + "]");
          tempString.delete(0, tempString.length());
          count = 0;
        }
      }
      cycle = cycle + 1;
    }
    if(tempString.toString() != "") {
      newString.append(tempString);
    }
    return newString.toString();
  }
 
 /** 5. moveAllXsRight is a method that outputs the same as the input except that every occurence of the input 
    * character should be shifted one character to the right. If it is impossible to shift a character to the right( it
    * is at the end of the string), then it is not shifted. The method takes a char and a string as inputs and returns 
    * a string.*/
  public static String moveAllXsRight(char movedLetter, String moveAllXsRightTest) {
   
    StringBuilder newString = new StringBuilder();                                     //output string will all designated chars moved right
    StringBuilder count = new StringBuilder();
    
    for(int cycle = 0; cycle < moveAllXsRightTest.length(); cycle = cycle + 1) {       //finds all the designated chars and moves them to the right
      if(moveAllXsRightTest.charAt(cycle) != movedLetter) {                                      
        newString.append(moveAllXsRightTest.charAt(cycle));
        newString.append(count);
        count.delete(0, moveAllXsRightTest.length());
      }
      else {                                                                           //all other non designated characters are added to the string
          count.append(movedLetter);
      }
    }
    newString.append(count);
    return newString.toString();
  }
  
  /** 6. moveXdown is a method that outputs the same as the input except that the first occurence of the input 
    * character should be swapped with one other character of the string. The character the input character is swapped 
    * with should be after the next occurrence of the special end-of-line character '\n', the same number of characters
    * after the end-of-line character as the first occurrence is after either its previous end-of-line character or the
    * start of the string, and before the next end-of-line character. If no such character exists in the string, the 
    * output should be the same as the input string. The method takes a char and a string as input and returns a 
    * string. */
  public static String moveXdown(char x, String stringO) {
    
    StringBuilder newString = new StringBuilder();  //output string
    int s = 0;                                      //how many new line positions until swapped 
    int w = 0;                                      //how many new line positions until x
    char swapped = x;                               //character x will be swapped with
    int linePosition = 0;                           //what position in the line the code is at
    int linePositionOfX = 0;                        //what position x is at
    boolean xHasMoved = false;                      //has x been moved yet or not
    boolean xHasBeenFound = false;                  //has the location of x been found yet
    boolean swappedHasMoved = false;                //has swapped character moved
    
    for(int i = 0; i < stringO.length(); i++) {     //loop that functions until swapped letter is found. Will set values that are needed to make output string
      linePosition++;
      if(stringO.charAt(i) == '\n') {               //marks the position of a new line character and how many
        linePosition = 0;
        s = s + 1;
      }
      if(stringO.charAt(i) == x && !xHasBeenFound) {                     //if x has been found, then sets its line postion, sets what line number, and sets its overall position
        linePositionOfX = linePosition;                                  
        linePosition++;                                                   
        xHasBeenFound = true;
        w = s;
      }
      if(w < s && w > s - 2 && xHasBeenFound && linePosition == linePositionOfX) {          //finds the letter x is swapped with on the next line
        swapped = stringO.charAt(i);
      }
    }
    linePosition = 0;
    for(int i = 0; i < stringO.length(); i++) {                       //adds to the out put string using values that we have set
      if(stringO.charAt(i) == '\n') {                                 //resets line position
        linePosition = 0;
      }
      if(stringO.charAt(i) == swapped && !swappedHasMoved && linePositionOfX == linePosition) {           //if the correct swapped char is found, adds x to output string
        swappedHasMoved = true;
        newString.append(x);
      }
      else if(stringO.charAt(i) == x && !xHasMoved) {         //if x is found, swapped char is placed
        xHasMoved = true;
        newString.append(swapped);
        linePosition++;
      }   
      else {                                               //occurences that are not the correct swapped char or x are added to the output string
        newString.append(stringO.charAt(i));
      }
      linePosition++;
    }
    return newString.toString();
  }
  
  
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  //EXTRA CREDIT
  
    /** 7. moveXleft is a method that outputs the same as the input except that the first occurrence of the 
      * input char is swapped with the character immediately to its left. If there is no occurrence of the input char or
      * if it is the first character of the input string, then the output will be identical to the input.*/
    public static String moveXleft(char movedLetter, String moveXleftTest) {
      StringBuilder newString = new StringBuilder();                                                         //output string that will have the designated char moved
      int count = 0;                                                                                         //notes how many times the char has been moved
      int position = 0;                                                                                      //original position of the movedLetter
      int newPosition = 0;                                                                                   //changed position (to the left) of the new number
      for(int i = 0; i < moveXleftTest.length(); i++) {                                                      //finds what psotion the moved letter is at; 
        if(moveXleftTest.charAt(i) == movedLetter && count == 0 && i != 0) {
          position = i;
          newPosition = position - 1;
          count = 1;
        }
      }
      for(int i = 0; i < moveXleftTest.length(); i++) {                                                     //moves the designated char to the position after the next char in the cycle
        if(count == 0) {
          return moveXleftTest;
        }
        if(newPosition == i) {
          newString.append(moveXleftTest.charAt(position));
          newString.append(moveXleftTest.charAt(position - 1));
          i = i + 1;
        }
        else {                                                                                             //adds letters other than the movedLetter to the output string
          newString.append(moveXleftTest.charAt(i));
        }
      }
      return newString.toString();
    }      
    
    /** 8. moveXup is a method that outputs the same as the input except that the first occurence of the input 
      * character should be swapped with one other character of the string. The character the input character is pushed into
      * the spot directly above it current position, the same number of characters
      * after the end-of-line character as the first occurrence is after either its previous end-of-line character or the
      * start of the string, and before the next end-of-line character. If no such character exists in the string, the 
      * output should be the same as the input string. The method takes a char and a string as input and returns a 
      * string. */
    public static String moveXup(char x, String stringO) {
      
      StringBuilder newString = new StringBuilder();  //output string
      int s = 0;                                      //used as a general count of new line characters 
      int w = 0;                                      //how many new line positions until x
      char swapped = x;                               //character x will be swapped with
      int linePosition = 0;                           //what position in the line the code is at
      int linePositionOfX = 0;                        //what position x is at
      boolean xHasMoved = false;                      //has x been moved yet or not
      boolean xHasBeenFound = false;                  //has the location of x been found yet
      boolean swappedHasMoved = false;                //has swapped character moved
      
      for(int i = 0; i < stringO.length(); i++) {     //loop that functions to find x. Will set values that are needed to make output string
        linePosition++;
        if(stringO.charAt(i) == '\n') {               //marks the position of a new line character and how many
          linePosition = 0;
          s = s + 1;
        }
        if(stringO.charAt(i) == x && !xHasBeenFound) {                     //if x has been found, then sets its line postion, sets what line number
          linePositionOfX = linePosition;                                  
          linePosition++;                                                   
          xHasBeenFound = true;
          w = s;
        }
      }   
      s = 0;
      linePosition = 0;   
      for(int i = 0; i < stringO.length(); i++) {     //loop that functions to find the swapped character. Will set values needed to make output string
        linePosition++;
        if(stringO.charAt(i) == '\n') {               //marks the position of a new line character and how many
          linePosition = 0;
          s = s + 1;
        }
        if(w > s && w - 2 < s && xHasBeenFound && linePosition == linePositionOfX) {          //finds the letter x is swapped with on the next line
          swapped = stringO.charAt(i);
        }
      }    
      linePosition = 1;
      s = 0;      
      for(int i = 0; i < stringO.length(); i++) {           //starts adding onto the new string with by using values we have set
        if(stringO.charAt(i) == '\n') {                     //counts how many new lines there are
          linePosition = 0;
          s = s + 1;
        }
        if(stringO.charAt(i) == x && !xHasMoved) {         //finds x and then adds swapped character to new string
          xHasMoved = true;
          newString.append(swapped);
          linePosition++;
        }
        else if(stringO.charAt(i) == swapped && !swappedHasMoved && linePositionOfX == linePosition && w > s && w - 2 < s) {         //finds the correct swapped char then adds x 
          swappedHasMoved = true;
          newString.append(x);
          linePosition++;
        }       
        else {                                          //adds occurences that are not the correct occurence of the swapped character or non-"x" letters
          newString.append(stringO.charAt(i));
        }
        linePosition++;
      }
      return newString.toString();
    }
}