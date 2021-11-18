import java.io.*;

/**
 * A class that will count the frequencies of words in a text file.
 */
public class WordCounter {
  
  /**
   * A method that will count all the word frequencies in a file.
   * @param input_file The name of the input text file.
   * @param output_file The name of the output text file.
   * @return String The statistics of our made hashtable.
   */
  public static String wordCount(String input_file, String output_file) {
    //making a hashtable from the converted text file that is a string
    WordHashTable table = new WordHashTable(2);
    try {
      //setting the text to the contants of the file
      String text = WordCounter.convertFile(input_file);
      //making the table from the String text
      WordCounter.makeTable(table, text);
    }
    //cathcing error
    catch (IOException e) {
      //presenting error
      return "Input File Error!";
    }
    try {
      //making a new text file from the data we retrieve from the hash table
      WordCounter.makeFile(table.makeCounts(), output_file);
    }
    //catching error
    catch (IOException e) {
      //presenting error
      return "Output File Error!";
    }
    //returning the statistics on the search.
    return table.getStatistics();
  }
  
  /**
   * A method that will convert ".txt" file into a String.
   * @param file The name of the file.
   * @return String The file contents represented as a string.
   */
  public static String convertFile(String file) throws IOException {
    //creating a new buffered reader from a file reader. Chosen for speed.
    BufferedReader reader = new BufferedReader(new FileReader (file));
    //creating a new String builder to store the read characters.
    StringBuilder text = new StringBuilder();
    //reading the text file by lines
    String line = reader.readLine();
    //loop until the text file has been completly read
    while(line != null) {
      //adding the line to the new string and starting a new line
      text.append(line + "\n");
      //iterate to the next line
      line = reader.readLine();
    }
    //closing the reader
    reader.close();
    //deleting the extra new line character at the end of the string
    text.deleteCharAt(text.length() - 1);
    //return text file as a string
    return text.toString();
  }
  
  /**
   * A method that will make the table from each word in the txt file.
   * @param table The WordHashTable we will be adding to.
   * @param text The contents of the text file.
   */
  public static void makeTable(WordHashTable table, String text) {
    //dividing the string by words
    String[] word = text.split("[^a-zA-Z]");
    //put the array into our table
    for(int i = 0; i < word.length; i++) {
      //if the item isnt null
      if(!word[i].equals("")) {
        //add it to our hash table
        table.addWord(word[i], 1);
      }
    }
  }
  
  /**
   * A method that will make a new text file with all the 
   * items in the hashtable and their frequencies.
   * @param data The words and frequencies of each item.
   * @param file The name of the file to be made.
   */
  public static void makeFile(String data, String file) throws IOException {
    //creating the file to dump the word frequencies into
    PrintWriter writer = new PrintWriter(file, "UTF-8");
    //writing the frequencies to the file
    writer.println(data);
    //closing the writer
    writer.close();
  } 
  
  /**
   * The main method to run the program.
   * @param args The input and output file name.
   */
  public static void main(String[] args) {
    //if there is a clear input and output
    if(args.length == 2) {
      //find the word count
      System.out.println(wordCount(args[0], args[1]));
    }
    else {
      //throw an error if argument doesnt match
      throw new IllegalArgumentException();
    }
  }
}