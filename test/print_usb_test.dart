import 'package:flutter_test/flutter_test.dart';
import 'package:print_usb/print_usb.dart';
import 'package:print_usb/print_usb_platform_interface.dart';
import 'package:print_usb/print_usb_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPrintUsbPlatform
    with MockPlatformInterfaceMixin
    implements PrintUsbPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PrintUsbPlatform initialPlatform = PrintUsbPlatform.instance;

  test('$MethodChannelPrintUsb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrintUsb>());
  });

  test('getPlatformVersion', () async {
    PrintUsb printUsbPlugin = PrintUsb();
    MockPrintUsbPlatform fakePlatform = MockPrintUsbPlatform();
    PrintUsbPlatform.instance = fakePlatform;

    //expect(await printUsbPlugin.getPlatformVersion(), '42');
  });
}
