import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());
  //funtion to get the users who has the same entred firstname or last name
  Future searchwithoutfilters(String name) async {
    try {
      var box = await Hive.box('useee');
      var hiveusers = box.values
          .where((element) => element.name == name || element.lastName == name)
          .toList();
      //check the return value if its empty emite no exist state
      if (hiveusers.isEmpty) {
        emit(SearchCubitNotExistState());
      } else {
        //emit the return list and exist state
        emit(SearchCubitExistState(hiveusers: hiveusers));
      }
    } catch (e) {
      print(e);
    }
  }
}
