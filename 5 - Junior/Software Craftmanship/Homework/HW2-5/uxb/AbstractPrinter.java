package uxb;

//a type of peripheral device representing printers
public abstract class AbstractPrinter<T extends AbstractPrinter.Builder<T>> extends AbstractPeripheral<T>
{
  public AbstractPrinter(Builder<T> builder) { super(builder); }
  
  public DeviceClass getDeviceClass()
  {
    return DeviceClass.PRINTER;
  }
  
  public static abstract class Builder<T> extends AbstractPeripheral.Builder<T>
  {
    public Builder(Integer version) { super(version); }
  }
}