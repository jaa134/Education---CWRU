package uxb;

import java.util.logging.*;
import java.util.LinkedList;
import java.math.BigInteger;
import java.util.Collections;

//a concrete device for recording
public class GoAmateur extends AbstractVideo<GoAmateur.Builder>
{
  private static final Logger logger = Logger.getLogger(GoAmateur.class.getName());
  
  private GoAmateur(Builder builder) { super(builder); }
  
  //signify the arrival of a message
  public void recv(StringMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    this.logger.info(getLogMessage(message, connector));
  }
  
  private final BinaryMessage replyMessage = new BinaryMessage(BigInteger.valueOf(293));
  //signify the arrival of a message
  public void recv(BinaryMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    forwardMessage(replyMessage, getConnectors(), Collections.emptyList());
    this.logger.info(getLogMessage(message));
  }
  
  //compute the log message for StringMessages
  public String getLogMessage(StringMessage message, Connector connector)
  {
    return "GoAmateur does not undersstand string messages: " + message.getString() + " " + connector.getIndex();
  }
  
  //compute the log message for BinaryMessages
  public String getLogMessage(BinaryMessage message)
  {
    return "GoAmateur is not yet active: " + message.getValue().intValue();
  }
  
  public static class Builder extends AbstractVideo.Builder<Builder>
  {
    public Builder(Integer version) { super(version); }
    
    public GoAmateur build()
    {
      validate();
      return new GoAmateur(getThis());
    }
    
    public Builder getThis() { return this; }
  }
}