package uxb;

import java.util.Optional;
import java.math.BigInteger;
import java.util.List;
import java.util.Set;

public interface Device 
{
  //return the device's product code
  Optional<Integer> getProductCode();
  //return the device's serial number
  Optional<BigInteger> getSerialNumber();
  //return the device's version
  Integer getVersion();
  //return the device's class based off DeviceClass Enum
  DeviceClass getDeviceClass();
  //return the amount of connectors associated with this device
  Integer getConnectorCount();
  //return a list of connector types associated with this device
  List<Connector> getConnectors();
  //return a connector for this device
  Connector getConnector(int index);
  //signify the arrival of a message
  void recv(StringMessage message, Connector connector);
  //signify the arrival of a message
  void recv(BinaryMessage message, Connector connector);
  //finds the devices that are directly connected through one of its connectors
  public Set<Device> peerDevices();
  //returns all devices that are reachable
  public Set<Device> reachableDevices();
  //determines if the device is connected
  public boolean isReachable(Device device);
}