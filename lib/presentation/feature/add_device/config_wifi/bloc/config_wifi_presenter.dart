import 'package:esptouch_flutter/esptouch_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../utilities/helpers/app_helper/wifi_helper.dart';
import '../../handle_connect/handle_connect_page.dart';
import 'config_wifi_state.dart';

class ConfigWifiPresenter extends Cubit<ConfigWifiState> {
  ConfigWifiPresenter({
    @visibleForTesting ConfigWifiState? state,
  }) : super(state ?? ConfigWifiState.initial());

  final ssid = TextEditingController();
  final password = TextEditingController();
  String bssid = '';

  Future<void> onStateCreated(BuildContext context) async {
    await isCheckPermissionLocation(context);
  }

  Future<String?> isCheckPermissionLocation(BuildContext context) async {
    if (await Permission.location.request().isGranted) {
      ssid.text = await WifiHelper.ssid;
      bssid = await WifiHelper.bssid;
      password.text = '';
    }
    return null;
  }

  void onTapAddOneDevice(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HandleConnectPage(
          ssid: ssid.text,
          bssid: bssid,
          password: password.text,
          packet: ESPTouchPacket.broadcast,
        ),
      ),
    );
  }

  void onTapAddMoreDevice(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HandleConnectPage(
          ssid: ssid.text,
          bssid: bssid,
          password: password.text,
          packet: ESPTouchPacket.broadcast,
        ),
      ),
    );
  }

  void onChangeSSID(String text) {
    _validButton();
  }

  void onChangePassword(String text) {
    _validButton();
  }

  Future<void> useCurrentWifi(BuildContext context) async {
    ssid.text = await WifiHelper.ssid;
    bssid = await WifiHelper.bssid;
    password.text = '14022019';
    FocusScope.of(context).requestFocus(FocusNode());
    _validButton();
  }

  void _validButton() {
    final valid = ssid.text.isNotEmpty && password.text.length >= 8;
    emit(state.copyWith(statusButton: valid));
  }
}
