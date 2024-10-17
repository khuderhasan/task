import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../colors_manager.dart';
import '../../globals.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connectivity_state.dart';

class ConnectionCubit extends Cubit<ConnectivityState> {
  ConnectionCubit()
      : super(ConnectivityState(
            connectionType: "Not Connected", vpnConnected: false)) {
    _listenConnectivity();
  }

  void _listenConnectivity() async {
    Connectivity().onConnectivityChanged.listen((_) async {
      await Future.delayed(const Duration(seconds: 1));
      checkConnectivity();
    });
  }

  bool _lastConnectionState = false;
  checkConnectivity() async {
    final status = await InternetConnection().hasInternetAccess;
    if (_lastConnectionState != status) {
      showToast(status);
    }
    Connectivity().checkConnectivity().then((connectivityResult) {
      updateConnectivity(connectivityResult);
    });
    _lastConnectionState = status;
  }

  void updateConnectivity(List<ConnectivityResult> result) {
    final newState = state.copyWith(
      connectionType: _getConnectionType(result.first),
      vpnConnected: result.contains(ConnectivityResult.vpn),
    );
    emit(newState);
  }

  String _getConnectionType(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return 'Mobile Network';
      case ConnectivityResult.wifi:
        return 'Wifi';
      default:
        return 'Not Connected';
    }
  }
}

void showToast(bool hasInternetAccess) {
  Fluttertoast.cancel();
  snackbarKey.currentState!.hideCurrentSnackBar();
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    msg: hasInternetAccess ? "Connected" : "Connection lost",
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    timeInSecForIosWeb: 5,
    backgroundColor:
        hasInternetAccess ? ColorsManager.customGreen : ColorsManager.customRed,
    textColor: Colors.white,
  );
  if (!hasInternetAccess) {
    snackbarKey.currentState!.showSnackBar(
      const SnackBar(
          backgroundColor: ColorsManager.customRed,
          duration: Duration(days: 1),
          content: Row(
            children: [
              Icon(Icons.wifi_off),
              SizedBox(width: 8),
              Text('You are Disconnected'),
            ],
          )),
    );
  }
}
