/** Jacob Alspaw EECS 132*/
/** Will represent a specific utility account*/
public class Account  {
  
  private double lineFee = 0.0; /** The account line fee is initially set to 0.0*/
  private double rate = 0.0; /** The account rate is initially set to 0.0*/
  private double taxRate = 0.0; /** The account tax rate is initally set to 0.0*/
  private double interestRate = 0.0; /** The account intrest rate is initially set to 0.0*/
  private double balance = 0.0; /** The account balance is initially set to 0.0*/
  private double monthBill = 0.0; /** The month's bill for the account is initially set to 0.0*/
  private double amountPaidThisMonth = 0.0; /** The amount paid this month for the account is initially set to 0.0*/
  private int expectedMonthlyUsage = 0; /** The expected monthly usage for the account is initially set to 0*/
  private int pastYearUsage = 0; /** The past year usage for the account is initially set to 0*/
  private boolean accountOpen = false; /** The account is initially set to closed or false*/
  private boolean monthlyPlan = false; /** The account is initially set to be off a monthly plan, or false*/
  private int currentYearUsage = 0; /** The current year usage for the account is initially set to 0*/
  private int currentMonthlyUsage = 0; /** The current monthly usage for the account is initially set to 0*/
  private Customer customer = null; /** The customer for the account is intially set to null*/
  private Date anniversaryDate = null; /** The anniversary date for the account is initially set to null*/
  
  /** First constructor for the account class. This constructor sets the line fee, the account rate, the tax rate, the interest rate, and the expected monthly usage.
    * The past year usage is set to 12 times the expected monthly usage*/
  public Account(double lineFee, double rate, double taxRate, double interestRate, int expectedMonthlyUsage) {
    this.lineFee = lineFee;
    this.rate = rate;
    this.taxRate = taxRate;
    this.interestRate = interestRate;
    this.expectedMonthlyUsage = expectedMonthlyUsage;
    this.pastYearUsage = 12 * this.expectedMonthlyUsage;
    this.accountOpen = false;
  }
 /** Second constructor for the account class. This constructor sets the line fee, the account rate, the tax rate, the interest rate, the expected monthly usage, the account's cusotmer,
   * and the date the acount was created*/
  public Account(double lineFee, double rate, double taxRate, double interestRate, int expectedMonthlyUsage, Customer customer, Date date) {
    this.lineFee = lineFee;
    this.rate = rate;
    this.taxRate = taxRate;
    this.interestRate = interestRate;
    this.expectedMonthlyUsage = expectedMonthlyUsage;
    this.pastYearUsage = 12 * this.expectedMonthlyUsage;
    this.customer = customer;
    this.anniversaryDate = date;
    this.accountOpen = true;
  }
    
  /** A: Sets the monthly fee for having service*/
  public void setLineFee(double lineFee) {
    this.lineFee = lineFee;
  }
  
  /** B: Returns the monthly fee for having service*/
  public double getLineFee() {
    return this.lineFee;
  }
  
  /** C: Sets the rate for the account*/
  public void setRate(double rate) {
    this.rate = rate;
  }
  
  /** D: Returns the rate for the account*/
  public double getRate() {
    return this.rate;
  }
  
  /** E: Sets the tax percentage that is applied to sales*/
  public void setSalesTaxRate(double taxRate) {
    this.taxRate = taxRate;
  }
  
  /** F: Returns the tax percentage that is applied to sales*/
  public double getSalesTaxRate() {
    return this.taxRate;
  }
  
  /** G: Sets the interest percentage that is applied to past-due amounts*/
  public void setInterestRate(double interestRate) {
    this.interestRate = interestRate;
  }
  
  /** H: Returns the interest percentage that is applied to past-due amounts*/
  double getInterestRate() {
    return this.interestRate;
  }
  
  /** I: Sets the amount of the service used by the account this month*/
  public void setMonthUsage(int monthUsage) {
    this.currentMonthlyUsage = monthUsage;
  }
  
  /** J:Returns the amount of the service used by the account this month*/
  public int getMonthUsage() {
    return this.currentMonthlyUsage;    
  }
  
  /** K: Returns the amount of the service used by the account in the previous year. PastYearUsage is calculated by the monthUsage multiplied by months in a year*/
  public int getPastYearUsage() {
    return (this.currentMonthlyUsage * 12);
  }
  
  /** L: Returns the current money balance on the account*/
  public double getBalance() {
    return balance;
  }
  
  /** M: Returns the ammount billed to the customer this month*/
  public double getMonthBill() {
    return monthBill;
  }
  
  /** N: Returns the ammount the customer has paid so far this month*/
  public double getAmountPaidThisMonth() {
    return amountPaidThisMonth;
  }
  
  /** O: Decreases the balance by the input amount and increases the amount paid by ammount*/
  public void receivePayment(double amount) {
    this.balance = getBalance() - amount;
    this.amountPaidThisMonth = amountPaidThisMonth + amount;
  }
  
  /** P: Sets the accounts customer to a certain customer and sets the account anniversary date to a date*/
  public void openAccount(Date date, Customer customer) {
    this.customer = customer;
    this.anniversaryDate = date;
  }
  
  /** Q: Returns true if the account is open and false otherwise*/
  public boolean isOpen() {
    if(accountOpen = true) {
      return true;
    }
    else 
        return false;
    }
  
  /** R: Returns the anniversary date for this account*/
  public Date getAnniversaryDate() {
    return anniversaryDate;
  }
  
  /** S: Returns the customer for the account*/
  public Customer getCustomer() {
    return customer;
  }
  
  /** T: The account is subjected to end of year processes. If the account is closed, nothing will happen. If the account is open, then expected monthly usage is calculated. Past year usage is set to 
    * current year usage. After, the current year usage is set to 0*/
  public void endOfYearProcessing() {
    if(accountOpen == false) {
    }
    if((accountOpen == true) && (monthlyPlan == false)) {
      this.expectedMonthlyUsage = (this.currentYearUsage) / 12;
    }
    if((accountOpen == true) && (monthlyPlan == true)) {
      this.expectedMonthlyUsage = (currentMonthlyUsage + (currentYearUsage - pastYearUsage)) / 12;
    }
    this.pastYearUsage = currentYearUsage;
    this.currentYearUsage = 0;
  }
  
  /** U: The account is subjected to end of month processes. If the account is closed, then nothing will happen. Otherwise, if the account is open, then fees will be processed. Current year usage is updated*/
  public void endOfMonthProcessing() {
    if(accountOpen == false) {
    }
    this.currentYearUsage = this.currentYearUsage + this.currentMonthlyUsage;
    this.balance = this.balance + this.lineFee + (this.currentMonthlyUsage * this.rate) + (this.taxRate * this.lineFee) + (this.taxRate * (this.currentMonthlyUsage * this.rate));
    if(amountPaidThisMonth < monthBill) {
      this.monthBill =  (interestRate * (monthBill - amountPaidThisMonth)) + balance;
    }
    if(monthlyPlan == false) {
      if(balance < 0) {
        balance = 0;
      }
      else
        this.monthBill = this.balance;
    }
    if(monthlyPlan == true) {
      if(monthBill > amountPaidThisMonth) {
      this.monthBill = (monthBill - amountPaidThisMonth + (interestRate * (monthBill - amountPaidThisMonth)) + lineFee + (rate * expectedMonthlyUsage) + (taxRate * (lineFee + (rate * expectedMonthlyUsage))));
      }
      if(monthBill > amountPaidThisMonth) {
      this.monthBill = (monthBill - amountPaidThisMonth + lineFee + (rate * expectedMonthlyUsage) + (taxRate * (lineFee + (rate * expectedMonthlyUsage))));
      }
    }
    int dollars = (int)this.monthBill;                /** "dollars" is the typecasted int value of dollars (it is only the dollars value of the month's bill)*/
    double fraction = this.monthBill - dollars;       /** "fraction" is the unrounded cents value for the month's bill*/
    int cents = (int)((fraction * 100) + 0.5);        /** "cents" is the rounded number of a change. Rounds the cents to the nearest penny*/
    this.monthBill = cents + dollars;                 /** Adds cents and dollars to get a rounded value*/
  }
  
  /** V: Determines if the account is on a monthly plan.Returns true is the account is on a monthly plan and false otherwise*/
  public boolean isOnMonthlyPlan() {
    if(monthlyPlan == true) {
      return true;
    }
    else
      return false;
  }
  
  /** W: Turns on the monthly plan setting and if the account is open, then the expected monthly usage will be set to 1/12 the past year usage*/
  public void turnOffMonthlyPlan() {
    monthlyPlan = false;
    if(accountOpen == true) {
      this.expectedMonthlyUsage = this.pastYearUsage / 12;
    }
  }
  
  /** X: Turns on the monthly plan setting and sets the expected monthly usage to the difference in past and current year usage divided by the number of months from the current date to the anniversary date.
    *    If the past year usage is smaller than the current year usage, the difference is replaced wih "0"*/
  public void turnOnMonthlyPlan() {
    monthlyPlan = true;
    if(accountOpen == true) {
      this.expectedMonthlyUsage = (this.pastYearUsage - this.currentYearUsage) / customer.getDate().monthsUntil(anniversaryDate);
    }
    if((accountOpen == true) && (pastYearUsage < currentYearUsage)) {
      this.expectedMonthlyUsage = 0 / customer.getDate().monthsUntil(anniversaryDate);
    }
    else {}
  }
  
  /** Y: Nothing is done if the account is closed. If values of inputed dates day and month is equal to anniversary date, end of year processing will proceed. If the date's day is equal to the anniversary 
    * date's day, end of month procssing will occur*/
  public void processDate(Date date) {
    if(accountOpen == false) {
    }
    if((accountOpen == true) && (date == anniversaryDate)) {
      endOfYearProcessing();
    }
    if((accountOpen == true) && (date.getDay() == anniversaryDate.getDay())) {
      endOfMonthProcessing();
    }
  }
}
    









