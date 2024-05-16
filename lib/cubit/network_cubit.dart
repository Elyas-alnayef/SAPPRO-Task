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
    //this method used to listen to the connectivity cahnges return list of connectivity result like wifi or moblie....
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      //check if the connectivity result contains wifi or moblie that means there is internet connection if contians
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile)) {
        //run this void function to emit connected state
        connectedfunc();
      } else {
        //when the connectivity result list dosen't contian  wifi or moblie run this void function to emit notconnected state  means no internet connection
        notconnectedfunc();
      }
    });
  }

  //when the widget closed or the bloc page closed or removed from the wiget tree close the subscription stream
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
