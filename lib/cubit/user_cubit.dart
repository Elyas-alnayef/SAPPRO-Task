import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  late List<dynamic> hiveusers;

  UserCubit() : super(UserInitial(hiveusers: []));
  //this function used to get the users from the api and save in the local storage
  //if the users saved before the function will not save them agin
  //if there is no internet connection the function will run getallusresfromhive function to get the users from local storage
  Future<void> getallusres() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      final dio = Dio();
      final response = await dio.get('https://dummyjson.com/users');
      if (response.statusCode == 200) {
        List<User> users = [];
        for (var i = 0; i < response.data['users'].length; i++) {
          users.add(User.fromJson(response.data['users'][i]));
        }
        try {
          var box = await Hive.box('useee');
          hiveusers = await getallusresfromhive();
          if (hiveusers.isEmpty) {
            for (var item in users) {
              print('ooookkk');
              box.add(item);
              hiveusers = await getallusresfromhive();
              emit(Successgetstate(hiveusers: hiveusers, internetstate: true));
            }
          } else {
            emit(Successgetstate(hiveusers: hiveusers, internetstate: true));
          }
        } catch (e) {
          emit(Errorstate(error: e.toString()));
        }
      }
    } else {
      hiveusers = await getallusresfromhive();
      if (hiveusers.isEmpty) {
        emit(Errorstate(error: "There is no data to get"));
      } else {
        emit(Successgetstate(hiveusers: hiveusers, internetstate: false));
      }
    }
  }

  //this function used to get all the users from the local storage and returns them as user list
  Future getallusresfromhive() async {
    try {
      var box = await Hive.box('useee');
      List<dynamic> hiveusers = box.values.toList();
      return hiveusers;
    } catch (e) {
      print(e);
    }
  }
}
