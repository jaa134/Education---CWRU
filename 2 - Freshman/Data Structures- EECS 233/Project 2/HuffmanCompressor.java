import java.io.*;

/**
 * A class that will compress a text file using Huffman encoding.
 */
public class HuffmanCompressor {   
  
  /**
   * The method to compress a text file from ASCII to our arbitrary denotation of characters.
   * @param inputFileName The name of the compressed file.
   * @param outputFileName The name of the file to be created.
   * @return String The representation of the text in binary.
   */
  public static String huffmanCoder(String inputFileName, String outputFileName) {
    //initialize a tree
    HuffmanTree tree = new HuffmanTree(new HuffArrayList(inputFileName));
    //get the codes from the tree
    tree.determineCodes();
    //make a string builder to add onto
    StringBuilder newString = new StringBuilder();
    //try a block  of code
    try {
      //converting text file to a string
      String text = HuffArrayList.convertFile(inputFileName);
      //loop to go through entire string
      for(int i = 0; i < text.length(); i++) {
        //analyzes each character and then appends huffman represenation of the char to the new string
        newString.append(HuffmanTree.codes[text.charAt(i)]);
      }
      //creating the file to dump the huffman encoded string into
      PrintWriter writer = new PrintWriter(outputFileName, "UTF-8");
      //writing the string to the file
      writer.println(newString.toString());
      //closing the writer
      writer.close();
      //storing frequecies back into field
      HuffArrayList.frequencies = HuffArrayList.findFrequencies(HuffArrayList.convertFile(inputFileName));
      //calculating the additional requirements
      calculate(text, newString.toString());
    }
    //catching the io exception from the bock of code
    catch (IOException e) {
    }
    return "Done.";
  }
  
  /**
   * Create the file for calculations.
   * @param text The file contents in Sring format.
   * @param newString The contents of the file encoded.
   */
  public static void calculate(String text, String newString) {
    try {
      //creating the file to dump the space savings and  into
      PrintWriter writer = new PrintWriter("SpaceSavingsAndCodes.txt", "UTF-8");
      //writing the string to the file
      writer.println(spaceSavings(text, newString));
      //loop to go through each char
      for(int i = 0; i < 127; i++) {
        //printing each case
        writer.println(printCodes((char)i));
      }
      //closing the writer
      writer.close();
    }
    catch (IOException e) {
    }
  }
    
  /**
   * A method that will calculate the amount of space we have saved by converting from ASCII to huffman encoding.
   * @param s1 The text represented by ASCII characters.
   * @param s2 The text represented by Huffman Encoding.
   */
  public static String spaceSavings(String s1, String s2) {
    //the bits of ASCII
    int num1 = s1.length() * 8;
    //the bits of huffman encoding
    int num2 = s2.length();
    //the bytes saved
    int num3 = (num1 - num2)/8;
    //message to the user
    return ("You saved " + (num1 - num2) + " bits of space! Approxiamtely " + num3 + " bytes!"); 
  }
  
  /**
   * A method that will determine the huffman encodings for each character.
   * @param c The character who information will be perserved.
   * @return String The representation of the char in format "char: frequency: Huffman Code."
   */
  public static String printCodes(char c) {
    //building on our final table
    StringBuilder newString = new StringBuilder();
    //if the character isnt a char that aesthetically messes up the table
    if(c != '\n' && c != '\t') {
      //add it to the list as is
      String line = (c + ": " + HuffArrayList.frequencies[c] + ": " + HuffmanTree.codes[c]);
      return line;
    }
    //if its a new line
    else if(c == '\n') {
      //add it to the table with name new line
      String line = ("New Line" + ": " + HuffArrayList.frequencies[c] + ": " + HuffmanTree.codes[c]);
      return line;
    }
    //if its tab
    else {
      //add it to the table with the name tab
      String line = ("Tab" + ": " + HuffArrayList.frequencies[c] + ": " + HuffmanTree.codes[c]);
      return line;
    }
  }
  
  /**
   * A main method for the compression.
   * @param args An array of arguments.
   */
  public static void main(String[] args) {
    if(args.length == 2) {
    //runs the encoding process
    HuffmanCompressor.huffmanCoder(args[0], args[1]);
    }
    else {
      //throw an error if argument doesnt match
      throw new IllegalArgumentException();
    }
  }
}