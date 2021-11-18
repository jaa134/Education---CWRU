package uxb;

public class ConnectionException extends Exception
{
  public enum ErrorCode
  {
    CONNECTOR_BUSY,
    CONNECTOR_MISMATCH,
    CONNECTION_CYCLE
  }
  
  private final Connector connector;
  private final ErrorCode errorCode;
  
  public ConnectionException(Connector connector, ErrorCode errorCode)
  {
    this.connector = connector;
    this.errorCode = errorCode;
  }
    
  public Connector getConnector()
  {
    return this.connector;
  }
  
  public ErrorCode getErrorCode() 
  {
    return this.errorCode;
  }
}