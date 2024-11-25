import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'print_usb_method_channel.dart';

abstract class PrintUsbPlatform extends PlatformInterface {
  /// Constructs a PrintUsbPlatform.
  PrintUsbPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrintUsbPlatform _instance = MethodChannelPrintUsb();

  /// The default instance of [PrintUsbPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrintUsb].
  static PrintUsbPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrintUsbPlatform] when
  /// they register themselves.
  static set instance(PrintUsbPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
