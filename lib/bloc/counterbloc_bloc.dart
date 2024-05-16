// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'counterbloc_event.dart';
// part 'counterbloc_state.dart';

// class CounterblocBloc extends Bloc<CounterblocEvent, CounterblocState> {
//   int counter = 0;
//   CounterblocBloc() : super(CounterblocInitial()) {
//     on<CounterblocEvent>((event, emit) {
//       if (event is IncreamentEvent) {
//         counter += 1;
//         emit(Counterblocchangedstate(counter: counter));
//       } else if (event is DecreamentEvent) {
//         counter += -1;
//         emit(Counterblocchangedstate(counter: counter));
//       } else {
//         counter = 0;

//         emit(Counterblocchangedstate(counter: counter));
//       }
//     });
//   }
// }
