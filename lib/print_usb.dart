
import 'package:flutter/services.dart';
import 'model/usb_device.dart';

class PrintUsb {

  final MethodChannel _channel = const MethodChannel('print_usb_apm');

  Future<List<UsbDevice>> getList() async {
    final List<dynamic> results = await _channel.invokeMethod('getList');
    List<UsbDevice> devices = [];
    for (var result in results) {
      UsbDevice device = UsbDevice(
        name: result['name'],
        model: result['model'],
        isDefault: result['default'],
        available: result['available'],
      );
      if(device.available) {
        devices.add(device);
      }
    }
    return devices;
  }

  Future<bool> connect({required String name}) async {
    try {
      Map<String, dynamic> params = {"name": name};
      return await _channel.invokeMethod('connectPrinter', params) == 1
          ? true
          : false;
    }catch (e) {
      return false;
    }
  }

  Future<bool> _close() async {
    try {
      return await _channel.invokeMethod('close') == 1 ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> printBytes(List<int> bytes) async {
    try {
      Map<String, dynamic> params = {"bytes": Uint8List.fromList(bytes)};
      return await _channel.invokeMethod('printBytes', params) == 1 ? true : false;
    } catch (e) {
      await this._close();
      return false;
    }
  }
}
