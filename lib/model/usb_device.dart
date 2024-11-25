import 'dart:io';

class UsbDevice {
  late String name;
  late bool isDefault;
  late String model;
  late bool available;

  UsbDevice({required this.name, required this.model, required this.isDefault, required this.available});
}