import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'print_usb_platform_interface.dart';

/// An implementation of [PrintUsbPlatform] that uses method channels.
class MethodChannelPrintUsb extends PrintUsbPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('print_usb');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
