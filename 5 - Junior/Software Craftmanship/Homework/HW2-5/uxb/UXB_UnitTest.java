import static org.junit.Assert.*;
import org.junit.Test;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.io.*;
import uxb.*;

public class UXB_UnitTest
{
  //new up connector list
  ArrayList<uxb.Connector.Type> hubTypeList = new ArrayList<uxb.Connector.Type>(Arrays.asList(uxb.Connector.Type.COMPUTER, uxb.Connector.Type.PERIPHERAL, uxb.Connector.Type.COMPUTER, uxb.Connector.Type.COMPUTER, uxb.Connector.Type.COMPUTER));
  ArrayList<uxb.Connector.Type> printerTypeList = new ArrayList<uxb.Connector.Type>(Arrays.asList(uxb.Connector.Type.PERIPHERAL, uxb.Connector.Type.PERIPHERAL));
  ArrayList<uxb.Connector.Type> videoTypeList = new ArrayList<uxb.Connector.Type>(Arrays.asList(uxb.Connector.Type.PERIPHERAL, uxb.Connector.Type.PERIPHERAL));
  //new up hubs
  private uxb.Hub hub = new uxb.Hub.Builder(1).productCode(100).serialNumber(BigInteger.ONE).connectors(hubTypeList).build();
  //new up Cannon printer
  private uxb.CannonPrinter cannonPrinter = new uxb.CannonPrinter.Builder(1).productCode(100).serialNumber(BigInteger.ONE).connectors(printerTypeList).build();
  //new up GoAmateur
  private uxb.GoAmateur goAmateur = new uxb.GoAmateur.Builder(1).productCode(100).serialNumber(BigInteger.ONE).connectors(videoTypeList).build();
  //new up Sister printer 
  private uxb.SisterPrinter sisterPrinter = new uxb.SisterPrinter.Builder(1).productCode(100).serialNumber(BigInteger.ONE).connectors(printerTypeList).build();
  //new up connectors
  private uxb.Connector connector1 = new uxb.Connector(hub, 0, uxb.Connector.Type.COMPUTER);
  //new up binary messages
  private uxb.BinaryMessage bin_nullMessage = new uxb.BinaryMessage(null);
  private uxb.BinaryMessage bin_genericMessage1 = new uxb.BinaryMessage(BigInteger.ZERO);
  private uxb.BinaryMessage bin_genericMessage2 = new uxb.BinaryMessage(BigInteger.ONE);
  private uxb.BinaryMessage bin_genericMessage3 = new uxb.BinaryMessage(BigInteger.TEN);
  //new up string messages
  private uxb.StringMessage str_nullMessage = new uxb.StringMessage(null);
  private uxb.StringMessage str_genericMessage1 = new uxb.StringMessage("testString for message 1");
  private uxb.StringMessage str_genericMessage2 = new uxb.StringMessage("testString for message 2");
  private uxb.StringMessage str_genericMessage3 = new uxb.StringMessage("testString for message 3");
  
  /*
   * Connector Test
   */ 
  @Test
  public void testConnector()
  {
    //test constructor and get methods
    assertTrue("connector1 device test failed", connector1.getDevice() == hub);
    assertTrue("connector1 index test failed", connector1.getIndex() == 0);
    assertTrue("connector1 type test failed", connector1.getType() == uxb.Connector.Type.COMPUTER);
  }
  
  /*
   * BinaryMessage Test
   */
  @Test
  public void testBinaryMessage()
  {
    //test constructor and get methods
    assertTrue("null should default to a value of zero", bin_nullMessage.getValue() == BigInteger.ZERO);
    assertTrue("genericMessage value test failed", bin_genericMessage1.getValue() == BigInteger.ZERO);
    
    //test equals
    Object o = new Object();
    assertFalse("null objects will fail", bin_nullMessage.equals(null));
    assertFalse("null objects will fail", bin_genericMessage1.equals(null));
    assertFalse("objects should differ by type", bin_nullMessage.equals(o));
    assertFalse("objects should differ by type", bin_genericMessage1.equals(o));
    assertTrue("objects shouldn't differ", bin_nullMessage.equals(bin_nullMessage));
    assertTrue("objects shouldn't differ", bin_genericMessage1.equals(bin_genericMessage1));
  }
  
  /*
   * Hub, AbstractDevice Test 
   */
  @Test
  public void testHubDevice()
  {
    //test constructor (and therefore setters) and get methods
    assertTrue("hub1 product code test failed", hub.getProductCode().get() == 100);
    assertTrue("hub1 serial number test failed", hub.getSerialNumber().get() == BigInteger.ONE);
    assertTrue("hub1 version test failed", hub.getVersion() == 1);
    assertTrue("hub1 connector type list test failed", hub.getConnectorTypes().equals(hubTypeList));
//    assertTrue("hub1 connector at index test failed", hub.getConnector(0) == connector1);                              //should use .equals method
//    assertTrue("hub1 connector at index test failed", hub.getConnector(1) == connector2);                              //should use .equlas method
    assertTrue("hub1 connector count test failed", hub.getConnectorCount() == 5);
  }
  
  //test validation
  @Test(expected = NullPointerException.class)
  public void testDeviceVersionValidation() {
    uxb.Hub nullHub = new uxb.Hub.Builder(null).productCode(0).serialNumber(BigInteger.ZERO).connectors(null).build();
  }
  
  //test validation
  @Test(expected = IllegalStateException.class)
  public void testDeviceConnectionTypeValidation() {
    uxb.Hub nullHub = new uxb.Hub.Builder(0).productCode(0).serialNumber(BigInteger.ZERO).connectors(null).build();
  }
  
  //the broadcast test
  @Test
  public void broadcast()
  {
    //make device list
    ArrayList<uxb.Device> deviceList = new ArrayList<uxb.Device>
      (Arrays.asList(hub, cannonPrinter, goAmateur, sisterPrinter));
    
    //make message list
    ArrayList<uxb.Message> messageList = new ArrayList<uxb.Message>
      (Arrays.asList(bin_genericMessage1, str_genericMessage1));
    
    //capture logs from System.err (ConsoleHandler)
    ByteArrayOutputStream log = new ByteArrayOutputStream();
    PrintStream ps = new PrintStream(log);
    PrintStream old = System.err;
    System.setErr(ps);
    
    //deliver messages
    for(uxb.Device device : deviceList)
    {
      //send the binary message to devices zeroth connector
      messageList.get(0).reach(device, device.getConnectors().get(0));
      //send the string message to devices zeroth connector
      messageList.get(1).reach(device, device.getConnectors().get(0));
    }
    
    //flush the stream and reset System.err
    System.err.flush();
    System.setErr(old);
    
    //find the expected vlaue
    SimpleDateFormat date = new SimpleDateFormat("MMM d, yyyy H:mm:ss aaa");
    String dateStr = date.format(new Date());
    String expectedVal = dateStr + " uxb.CannonPrinter recv\r\n"
                       + "INFO: Cannon printer has printed the binary message: 0\r\n"
                       + dateStr + " uxb.CannonPrinter recv\r\n"
                       + "INFO: Cannon printer has printed the string: testString for message 1 1\r\n"
                       + dateStr + " uxb.GoAmateur recv\r\n"
                       + "INFO: GoAmateur is not yet active: 0\r\n"
                       + dateStr + " uxb.GoAmateur recv\r\n"
                       + "INFO: GoAmateur does not undersstand string messages: testString for message 1 0\r\n"
                       + dateStr + " uxb.SisterPrinter recv\r\n"
                       + "INFO: Sister printer has printed the binary message: 100\r\n"
                       + dateStr + " uxb.SisterPrinter recv\r\n"
                       + "INFO: Sister Printer has printed the string: testString for message 1 1\r\n";
    
    //compare captured string to expected output
    assertTrue("Log messages don't match.", expectedVal.equals(log.toString()));
  }
  
  //test the reachable methods
  @Test
  public void testReachables() {
    try 
    {
      hub.getConnector(0).setPeer(cannonPrinter.getConnector(0));
      hub.getConnector(2).setPeer(sisterPrinter.getConnector(0));
      hub.getConnector(3).setPeer(goAmateur.getConnector(0));
      assertTrue("Testing the amount of reachable devices. Actual Value:" + hub.peerDevices().size(), hub.peerDevices().size() == 3);
      assertTrue("Testing the amount of reachable devices.", cannonPrinter.peerDevices().size() == 1);
      assertTrue("Testing the amount of reachable devices.", sisterPrinter.peerDevices().size() == 1);
      assertTrue("Testing the amount of reachable devices.", goAmateur.peerDevices().size() == 1);
      assertTrue("Testing if one end of the connection path can reach the other.", hub.isReachable(goAmateur));
    }
    catch (NullPointerException e)
    {
      fail("There was a null peer. " + e);
    }
    catch (uxb.ConnectionException e)
    {
      fail("There was a connection exception. " + e.getErrorCode());
    }
  }
  
  //Testing message passing
  @Test
  public void SystemTest()
  {
    uxb.Hub hub1 = new uxb.Hub.Builder(1).productCode(100).serialNumber(BigInteger.ONE).connectors(hubTypeList).build();
    uxb.Hub hub2 = new uxb.Hub.Builder(2).productCode(200).serialNumber(BigInteger.TEN).connectors(hubTypeList).build();
    uxb.CannonPrinter cannonPrinter1 = new uxb.CannonPrinter.Builder(3).productCode(300).serialNumber(BigInteger.ONE).connectors(printerTypeList).build();
    uxb.CannonPrinter cannonPrinter2 = new uxb.CannonPrinter.Builder(4).productCode(400).serialNumber(BigInteger.ONE).connectors(printerTypeList).build();
    uxb.SisterPrinter sisterPrinter1 = new uxb.SisterPrinter.Builder(5).productCode(500).serialNumber(BigInteger.ONE).connectors(printerTypeList).build();
    uxb.GoAmateur goAmateur1 = new uxb.GoAmateur.Builder(1).productCode(600).serialNumber(BigInteger.ONE).connectors(videoTypeList).build();
    
    try 
    {
      hub1.getConnector(0).setPeer(cannonPrinter1.getConnector(0));
      hub1.getConnector(2).setPeer(cannonPrinter2.getConnector(0));
      hub1.getConnector(3).setPeer(sisterPrinter1.getConnector(0));
      hub1.getConnector(4).setPeer(goAmateur1.getConnector(0));
      hub2.getConnector(0).setPeer(cannonPrinter2.getConnector(1));
    }
    catch (NullPointerException e)
    {
      fail("There was a null peer. " + e);
    }
    catch (uxb.ConnectionException e)
    {
      fail("There was a connection exception. " + e.getErrorCode());
    }
    
    hub1.recv(new uxb.StringMessage("Hamminator"), hub1.getConnector(1));
    //broadcasts to webcame and everything else
    hub1.recv(new uxb.BinaryMessage(BigInteger.ZERO), hub1.getConnector(4));
  }
}