#include "include/print_usb/print_usb_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "print_usb_plugin.h"

void PrintUsbPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  print_usb::PrintUsbPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
