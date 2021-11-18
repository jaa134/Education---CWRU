package uxb;

import java.util.logging.*;
import java.util.Optional;

//a concrete device for printing
public class CannonPrinter extends AbstractPrinter<CannonPrinter.Builder>
{
  private static final Logger logger = Logger.getLogger(CannonPrinter.class.getName());
  
  private CannonPrinter(Builder builder) { super(builder); }
  
  //signify the arrival of a message
  public void recv(StringMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    this.logger.info(getLogMessage(message));
  }
  
  //signify the arrival of a message
  public void recv(BinaryMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    this.logger.info(getLogMessage(message));
  }
  
  //compute the StringMessage log message
  public String getLogMessage(StringMessage message)
  {
    return "Cannon printer has printed the string: " + message.getString() + " " + getVersion();
  }
  
  //compute the BinaryMessage log message
  public String getLogMessage(BinaryMessage message)
  {
    //message will differ based on the device having a serial number
    if (getSerialNumber().isPresent()) 
      return "Cannon printer has printed the binary message: " + (message.getValue().intValue() * getSerialNumber().get().intValue());
    else 
      return "Cannon printer has printed the binary message: " + message.getValue().intValue();
  }
  
  public static class Builder extends AbstractPrinter.Builder<Builder>
  {
    public Builder(Integer version) { super(version); }
    
    public CannonPrinter build()
    {
      validate();
      return new CannonPrinter(getThis());
    }
    
    public Builder getThis() { return this; }
  }
}