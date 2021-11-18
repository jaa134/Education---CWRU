package uxb;

//an outline of a message definition. messages will be passed between devices
public interface Message
{
  //signifies that the message has reached the given device
  void reach(Device device, Connector connector);
}