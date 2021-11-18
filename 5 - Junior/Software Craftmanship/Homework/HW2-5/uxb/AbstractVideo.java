package uxb;

//a type of peripheral device representing video players
public abstract class AbstractVideo<T extends AbstractPeripheral.Builder<T>> extends AbstractPeripheral<T>
{
  public AbstractVideo(Builder<T> builder) { super(builder); }
  
  public DeviceClass getDeviceClass()
  {
    return DeviceClass.VIDEO;
  }
  
  public static abstract class Builder<T> extends AbstractPeripheral.Builder<T>
  {
    public Builder(Integer version) { super(version); }
  }
}