import java.util.*;

/*
 * DatabaseType is an interface for the Database class. This interface will 
 * contain the method stub Comparator.
 * @author Jacob Alspaw
 */

public interface DatabaseType {
  
  /*
   * getComparatorByTrait is a getter-method stub and is part of
   * Comparator from an interface in java.util.
   * @param trait Is the trait of the contact.
   */
  public Comparator<DatabaseType> getComparatorByTrait(String trait);
}
  
