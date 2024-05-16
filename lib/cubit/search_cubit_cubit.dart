import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());

  Future searchwithoutfilters(String name) async {
    try {
      var box = await Hive.box('useee');
      var hiveusers = box.values
          .where((element) => element.name == name || element.lastName == name)
          .toList();
      if (hiveusers.isEmpty) {
        emit(SearchCubitNotExistState());
      } else {
        emit(SearchCubitExistState(hiveusers: hiveusers));
      }
    } catch (e) {
      print(e);
    }
  }
}
