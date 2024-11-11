import 'dart:async';

import 'package:flutter/services.dart';

enum ReturnValue {
  enabled,
  disabled,
  notAvailable,
}

class DisableBatteryOptimization {
  static const MethodChannel _channel =
      const MethodChannel('in.jvapps.disable_battery_optimization');

  static Future<ReturnValue> showEnableAutoStartSettings(
      String dialogTitle, String dialogBody) async {
    final value = await _channel.invokeMethod(
        'showEnableAutoStart', <dynamic>[dialogTitle, dialogBody]);
    return _parseReturnValue(value);
  }

  static Future<ReturnValue> showDisableManufacturerBatteryOptimizationSettings(
      String dialogTitle, String dialogBody) async {
    final value = await _channel.invokeMethod(
        'showDisableManBatteryOptimization',
        <dynamic>[dialogTitle, dialogBody]);
    return _parseReturnValue(value);
  }

  static Future<ReturnValue> showDisableBatteryOptimizationSettings(
      String dialogTitle, String dialogBody) async {
    final value = await _channel.invokeMethod(
        'showDisableBatteryOptimization', <dynamic>[dialogTitle, dialogBody]);
    return _parseReturnValue(value);
  }

  static Future<ReturnValue> showDisableAllOptimizationsSettings(
      String autoStartTitle,
      String autoStartBody,
      String manBatteryTitle,
      String manBatteryBody) async {
    final value = await _channel.invokeMethod(
        'disableAllOptimizations', <dynamic>[
      autoStartTitle,
      autoStartBody,
      manBatteryTitle,
      manBatteryBody
    ]);
    return _parseReturnValue(value);
  }

  static Future<bool> get didCheckAutoStart async {
    return await _channel.invokeMethod("didCheckAutoStart");
  }

  static Future<bool> get isBatteryOptimizationDisabled async {
    return await _channel.invokeMethod("isBatteryOptimizationDisabled");
  }

  static Future<bool> get didCheckManufacturerBatteryOptimization async {
    return await _channel
        .invokeMethod("didCheckManufacturerBatteryOptimization");
  }

  static Future<bool> get isAllBatteryOptimizationDisabled async {
    return await _channel.invokeMethod("isAllOptimizationsDisabled");
  }

  static Future<void> callAutoStart() async {
    await _channel.invokeMethod("callAutoStart");
  }

  static Future<void> callDisableBatteryOptimization() async {
    await _channel.invokeMethod("callDisableBatteryOptimization");
  }

  static Future<bool> isAutoStartAvailable() async {
    return await _channel.invokeMethod("isAutoStartAvailable");
  }

  static Future<bool> isManufacturerBatteryOptimizationAvailable() async {
    return await _channel
        .invokeMethod("isManufacturerBatteryOptimizationAvailable");
  }

  static ReturnValue _parseReturnValue(String value) {
    switch (value) {
      case "enabled":
        return ReturnValue.enabled;
      case "disabled":
        return ReturnValue.disabled;
      default:
    }
    print("Value  ${value}");
    return ReturnValue.notAvailable;
  }
}
