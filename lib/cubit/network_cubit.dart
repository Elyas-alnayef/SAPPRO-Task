import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitial());
  StreamSubscription? subscription;
  void connectedfunc() {
    emit(Connected());
  }

  void notconnectedfunc() {
    emit(NotConnected());
  }

  void checkNetworkConnection() {
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        print("sssssssssssssssssssssssssss");
        connectedfunc();
      } else {
        notconnectedfunc();
      }
    });
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
