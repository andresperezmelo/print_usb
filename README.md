# Documentation for the `PrintUsb` Class

The `PrintUsb` class provides an interface for interacting with connected USB devices, allowing you to retrieve a list of available devices, connect to a device, and print bytes.

## Methods

| Method Name           | Description                                                                                      |
|-----------------------|--------------------------------------------------------------------------------------------------|
| `getList()`           | Retrieves a list of connected USB devices. Filters available devices and returns a list of `UsbDevice` objects. |
| `connect(String name)`| Connects to a USB device specified by its name. Returns `true` if the connection was successful, otherwise `false`. |
| `_close()`            | Closes the current connection to the USB device. Returns `true` if the disconnection was successful, otherwise `false`. |
| `printBytes(List<int> bytes)` | Sends a byte array to the USB device to print. Returns `true` if the operation was successful, otherwise `false`. |

## Description of the `PrintUsb` Class

The `PrintUsb` class uses a method channel (`MethodChannel`) to communicate with a native platform (such as Android or Windows) that handles the connections and printing through USB devices. Each of its methods interacts with this channel to perform the corresponding actions.

### 1. `getList()`

This method invokes the native method `getList` to obtain a list of connected USB devices. The devices are represented by the `UsbDevice` class, which contains the following attributes:

- **name**: The device's name.
- **model**: The device's model.
- **isDefault**: Indicates whether the device is the default.
- **available**: Indicates whether the device is available for use.

Only devices that are available are included in the list.

### 2. `connect(String name)`

Allows you to connect to a USB device by its name. The device's name is passed as a parameter to the native platform, and a response is awaited to confirm the connection. If the response is `1`, the device is successfully connected, and the method returns `true`. Otherwise, it returns `false`.

### 3. `_close()`

This method attempts to close the current connection to the USB device. If the native platform responds with `1`, the disconnection is successful, and the method returns `true`. If not, it returns `false`.

### 4. `printBytes(List<int> bytes)`

This method sends a byte array to the USB device to print. The `bytes` parameter is a list of integers representing the data to be printed. If the operation is successful (native platform responds with `1`), the method returns `true`. If an error occurs, the connection is closed by calling the `_close()` method and the method returns `false`.

## Example Usage

```dart
void main() async {
  PrintUsb printer = PrintUsb();
  
  // Get the list of available devices
  List<UsbDevice> devices = await printer.getList();
  print(devices);

  // Connect to the first available device
  if (devices.isNotEmpty) {
    bool isConnected = await printer.connect(name: devices[0].name);
    if (isConnected) {
      print("Successfully connected to the device.");
    }
  }

  // Print data
  List<int> data = [0x1B, 0x40]; // Example print bytes
  bool isPrinted = await printer.printBytes(data);
  if (isPrinted) {
    print("Data printed successfully.");
  }
}
