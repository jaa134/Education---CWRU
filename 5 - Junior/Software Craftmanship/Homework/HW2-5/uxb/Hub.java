package uxb;

import java.util.logging.*;
import java.io.IOException;
import java.util.Arrays;

//a type of device
public class Hub extends AbstractDevice<Hub.Builder>
{
  private static final Logger logger = Logger.getLogger(Hub.class.getName());
  
  //intialize the hub by invoking parent class constructor
  private Hub(Builder builder) { super(builder); }
  
  //return the device class of this hub which is defined in the DeviceClass Enum as HUB
  public DeviceClass getDeviceClass()
  {
    return DeviceClass.HUB;
  }
  
  //signify the arrival of a message
  public void recv(StringMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    forwardMessage(message, getConnectors(), Arrays.asList(connector));
  }
  
  //signify the arrival of a message
  public void recv(BinaryMessage message, Connector connector)
  {
    verifyRecv(message, connector);
    forwardMessage(message, getConnectors(), Arrays.asList(connector));
  }
  
  //a builder that will allow valiation of the hub object before initialization
  public static class Builder extends AbstractDevice.Builder<Builder>
  {
    //invoke parent class constructor to set version number
    public Builder (Integer version) { super(version); }
    
    //validate the device, then initialize it if validated
    public Hub build()
    {
      validate();
      return new Hub(getThis());
    }
    
    protected Builder getThis() { return this; }
    
    /*determines if device object is valid. throws error if not. valid devices have a non-null version number and 
    contain atleast one computer and one peripheral connector type*/
    protected void validate()
    {
      super.validate();
      if (!super.getConnectors().contains(Connector.Type.COMPUTER))
        throw new IllegalStateException("Validation failed because no computer connection types were detected.");
      if (!super.getConnectors().contains(Connector.Type.PERIPHERAL))
        throw new IllegalStateException("Validation failed because no peripheral connection types were detected.");
    }
  }
}