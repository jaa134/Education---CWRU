/** Jacob Alspaw EECS 132*/
/** Date class that will set the date*/
public class Date {
  
  private int day = 0; /** The day of the date is initially set to 0*/
  private int month = 0; /** The month of the date is initially set to 0*/
  private int numMonthsUntil = 0; /** The number of months until an inputted date is initially set to 0*/
  
 /** Constructor method. Sets the current date*/
  public Date(int day, int month) {
    this.day = day;
    this.month = month;
  }
  
  /** A. Returns the day of the date. Values are between 1 and 31*/
  public int getDay() {
    return day;
  }
  
  /** B. Returns the month of the date. Values are between 1 and 12*/
  public int getMonth() {
    return month;
  }
  
  /** C. Adds 1 to the day of the date. Dates cycle through like normal*/
  public void incrementDay() {
    day = day + 1;
      if ((day > 31) && (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10)) {
        day = 1;
        month = month + 1;
      }
      if ((day > 30) && (month == 4 || month == 6 || month == 9 || month == 11)) {
        day = 1;
        month = month + 1;
      }
      if ((day > 31) && (month == 12)) {
        day = 1;
        month = 1;
      }
      if ((day > 28) && (month == 2)) {
        day = 1;
        month = 3;
      }
  }
  
  /** Returns a value in months until a certain date. Months are always rounded up. Example: 4 months and 1 day = 5 motnhs*/
  public int monthsUntil(Date date) {
    this.numMonthsUntil = date.getMonth() - this.getMonth();
    if(this.numMonthsUntil < 0) {
      this.numMonthsUntil = this.numMonthsUntil + 12;
    }
    if((this.month == 2) && (this.day > 27)) {
      return this.numMonthsUntil; 
    }
    if((this.month == 4 || this.month == 6 || this.month == 9 || this.month == 11) && (getDay() > 30)) {
      return this.numMonthsUntil;
    }   
    if(date.day > this.day) {
      this.numMonthsUntil = this.numMonthsUntil + 1;
    }
    return numMonthsUntil;
  }
  
}