
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
      emit(Successgetstate(hiveusers: hiveusers, internetstate: false));
    }
  }

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






































// Map<String, dynamic> user = {
//       'id': response.data['users'][1]['id'],
//       'name': response.data['users'][1]['firstName'],
//       'lastname': response.data['users'][1]['lastName'],
//       'age': response.data['users'][1]['age'],
//       'gender': response.data['users'][1]['gender'],
//       'email': response.data['users'][1]['email'],
//       'phone': response.data['users'][1]['phone'],
//       'birthDate': response.data['users'][1]['birthDate'],
//       'iamge': response.data['users'][1]['iamge'],
//       'address': response.data['users'][1]['address'],
//     }





// try {
//       var box = await Hive.box('useee');
//       List<dynamic> users = await getallusresfromhive();
//       final dio = Dio();
//       for (int i = 0; i < users.length; i++) {
//         try {
//           final response = await dio.get(users.cast<User>()[i].image);
//           Uint8List imageBytes = response.data.readAsBytes();
//           String base64String = base64Encode(imageBytes);
//           print('jjjjjjjjjjj' + base64String);
//         } catch (e) {
//           print('something went wrong ');
//         }

//         
//       }
//     } catch (e) {
//       print(e);
//     }







