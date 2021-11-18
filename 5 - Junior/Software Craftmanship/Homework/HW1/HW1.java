//Jacob Alspaw
//jaa134

import java.util.*;

public class HW1<T> implements Comparator<Character>
{
  public List<T> longestPrefix (List<T> a, List<T> b, Comparator<? super T> cmp)
  {
    List<T> lcp = new ArrayList<T>();
    int shorterLength = Math.min(a.size(), b.size());
    for(int i = 0; i < shorterLength; i++)
    {
      if (cmp.compare(a.get(i), b.get(i)) == 0) lcp.add(a.get(i));
      else break; //or return lcp;
    }
    return lcp;
  }
  
  public static List<Character> stringToList (String str)
  {
    char[] charArray = str.toCharArray();
    List<Character> charList = new ArrayList<Character>();
    for(char c : charArray) 
    {
      charList.add(c);
    }
    return charList;
  }
  
  public static String listToString (List<Character> list)
  {
    StringBuilder newString = new StringBuilder();
    for(char c : list)
    {
      newString.append(c);
    }
    return newString.toString();
  }
  
  public static void printResult (List<Character> list)
  {
    if (list.isEmpty()) System.out.println("No common prefix.");
    else System.out.println(listToString(list));
  }
  
  public int compare (Character c1, Character c2) {
    return c1 == c2 ? 0 : -1;
  }
  
  public static void main (String[] args)
  {
    if (args.length == 2)
    {
      HW1<Character> hw1 = new HW1<Character>();
      List<Character> lcp = hw1.longestPrefix(stringToList(args[0]), stringToList(args[1]), hw1);
      printResult(lcp);
    }
    else
      System.out.println("Main method must be two arguments of type string.");
  }
}