part of 'connectivity_cubit.dart';

class ConnectivityState {
  String? connectionType;
  bool? vpnConnected;
  ConnectivityState({this.connectionType, this.vpnConnected});

  ConnectivityState copyWith({String? connectionType, bool? vpnConnected}) {
    return ConnectivityState(
      connectionType: connectionType ?? this.connectionType,
      vpnConnected: vpnConnected ?? this.vpnConnected,
    );
  }
}
