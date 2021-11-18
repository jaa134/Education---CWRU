package uxb;

//a message passed between devices of type string
public final class StringMessage implements Message
{
  private final String message;
  
  public StringMessage(String string)
  {
    //null param set to empty string
    this.message = string == null ? "" : string;
  }
  
  public String getString()
  {
    return this.message;
  }
  
  //test if two string messages are equal. test for null, test for types, then test underlying string
  @Override
  public boolean equals(Object anObject)
  {
    return anObject != null && anObject instanceof StringMessage && this.isValueEqual((StringMessage)anObject);
  }
  
  //checks the underlying string value of the messages
  private boolean isValueEqual(StringMessage message)
  {
    return this.getString().equals(message.getString());
  }
  
  //signifies message has reached the given device
  public void reach(Device device, Connector connector)
  {
    device.recv(this, connector);
  }
  
  /***************************/
  /*  Begin String Wrappers  */
  /***************************/
  
  public int length()
  {
    return getString().length(); 
  }
  
  public char charAt(int index)
  {
    return getString().charAt(index);
  }
  
  public boolean contains(CharSequence s)
  {
    return getString().contains(s);
  }
  
  public boolean endsWith(String suffix)
  {
    return getString().endsWith(suffix);
  }
  
  public boolean startsWith(String prefix)
  {
    return getString().startsWith(prefix);
  }
  
  public boolean startsWith(String prefix, int toffset)
  {
    return getString().startsWith(prefix, toffset);
  }
  
  public int indexOf(int ch)
  {
    return getString().indexOf(ch);
  }
  
  public int indexOf(int ch, int fromIndex)
  {
    return getString().indexOf(ch, fromIndex);
  }
  
  public int indexOf(String str)
  {
    return getString().indexOf(str);
  }
  
  public int indexOf(String str, int fromIndex)
  {
    return getString().indexOf(str, fromIndex);
  }
  
  public int lastIndexOf(int ch)
  {
    return getString().lastIndexOf(ch);
  }
  
  public int lastIndexOf(int ch, int fromIndex)
  {
    return getString().lastIndexOf(ch, fromIndex);
  }
  
  public int lastIndexOf(String str)
  {
    return getString().lastIndexOf(str);
  }
  
  public int lastIndexOf(String str, int fromIndex)
  {
    return getString().lastIndexOf(str, fromIndex);
  }
  
  public boolean isEmpty()
  {
    return getString().isEmpty();
  }
  
  public int hashCode()
  {
    return getString().hashCode();
  }
}