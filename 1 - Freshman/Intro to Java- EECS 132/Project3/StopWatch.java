

public class StopWatch {
  
  private long start;
  
  /**
   * Initialize a stopwatch object.
   */
  public StopWatch() {
    start = System.currentTimeMillis();
  }
  
  public void startTime() {
    start = 0;
  }
  
  public int elapsedTime() {
    long now = System.currentTimeMillis();
    return (int)((now - start) / 1000.0);
  }
  
  public void resetTime() {
    start = 0;
  }
  
  
  
  /** Sets the starting time */
  public void startTime() {
    start = System.currentTimeMillis();
  }
  
  /** Time elapsed since beginning
    * @return int is the time
    */
  public int elapsedTime() {
    long now = System.currentTimeMillis();
    return (int)((now - start) / 1000.0);
  }
  
  /** Resets the time */
  public void resetTime() {
    start = 0;
  }
}