/** Jacob Alspaw EECS 132*/
/** Customer class that represents a person of group that is an owner of an account*/
public class Customer {
  
  private String firstName = null; /** The first name of the customer is initially set to nothing*/
  private String lastName = null; /** The last name of the cusotmer is initially set to nothing*/
  private String address = null; /** The address of the customer is initially set to nothing*/
  private Account electricAccount = null; /** The electric account for the customer is initially set to nothing*/
  private Account gasAccount = null; /** The gas account for the customer is initially set to nothing*/
  private Account waterAccount = null; /** The water account for the customer is initially set to nothing*/
  private Date date = null; /** The date associated with the customer is initially set to nothing*/
  
  /** First constructor for the customer class. This constructor sets the last name of the customer and the adress for the cusotmer*/
  public Customer(String lastName, String address) {
    this.lastName = lastName;
    this.address = address;
  }
  
  /** Second costructor for the customer class. This constructor sets the first name and last name of the customer, the customer's adress, and the date associated with the customer*/
  public Customer(String firstName, String lastName, String address, Date date) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.address = address;
    this.date = date;
  }
  
  /** A: Changes the first name associated with the customer*/
  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
  
  /** B: Returns the first name associated with the customer*/
  public String getFirstName() {
    return firstName;
  }
  
  /** C: Chnages the last name associated with the customer*/
  public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  
  /** D: Returns the last name associated with the customer*/
  public String getLastName() {
    return lastName;
  }
  
  /** E: Changes the address associated with the customer*/
  public void setAdress(String address) {
    this.address = address;
  }
  
  /** F: Returns the address associated with the customer*/
  public String getAddress() {
    return address;
  }
  
  /** G: Assigns an account for electricity usage fr this customer*/
  public void setElectricAccount(Account electricAccount) {
    this.electricAccount = electricAccount;
  }
  
  /** H: Returns the account for electricity usage by this customer*/
  public Account getElectricAccount() {
    return electricAccount;
  }
  
  /** I: Assigns an account for natural gas usage for this customer*/
  public void setGasAccount(Account gasAccount) {
    this.gasAccount = gasAccount;
  }
  
  /** J: Returns the account for natural gas usage by the customer*/
  public Account getGasAccount() {
    return gasAccount;
  }
  
  /** K: Assigns m account for water usage for this customer*/
  public void setWaterAccount(Account waterAccount) {
    this.waterAccount = waterAccount;
  }
  
  /** L: Returns the account for natural gas usage by this customer*/
  public Account getWaterAccount() {
    return waterAccount;
  }
  
  /** M: Sets a Date instance associated with this customer*/
  public void setDate(Date date) {
    this.date = date;
  }
  
  /** N: Returns a Date instance associated with this customer*/
  public Date getDate() {
    return this.date;
  }
  
  /** O: Calls the associated method of the Date class to increment the date. Calls the processDate method of each account that exists for the customer*/
  public void incrementDate() {
    date.incrementDay();
    if(electricAccount != null) {
      electricAccount.processDate(date);
    }
    if(gasAccount != null) {
      gasAccount.processDate(date);
    }
    if(waterAccount != null) {
      waterAccount.processDate(date);
    }    
  }
}
