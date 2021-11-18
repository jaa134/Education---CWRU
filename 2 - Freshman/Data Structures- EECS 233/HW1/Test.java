import java.io.*;
public class Test {
  public static int occurrences(String s, char c) {
    int j = 0;
    System.out.println(j + "");
    j++;
    if (s.length() == 0) return 0;
    return occurrences(String.valueOf(s.charAt(0)), c) + occurrences(s.substring(1), c);
  }
}
