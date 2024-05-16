// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/bloc/counterbloc_bloc.dart';

// class CounterPage extends StatelessWidget {
//   const CounterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Counter page "),
//       ),
//       body: Column(children: [
//         BlocBuilder<CounterblocBloc, CounterblocState>(
//           builder: (context, state) {
//             if (state is CounterblocInitial) {
//               return const Text("0");
//             } else if (state is Counterblocchangedstate) {
//               return Text(state.counter.toString());
//             } else {
//               return Container();
//             }
//           },
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         TextButton(
//             onPressed: () {
//               context.read<CounterblocBloc>().add(IncreamentEvent());
//             },
//             child: Text("increament ")),
//         TextButton(
//             onPressed: () {
//               context.read<CounterblocBloc>().add(DecreamentEvent());
//             },
//             child: Text("decreament ")),
//         TextButton(
//             onPressed: () {
//               context.read<CounterblocBloc>().add(ResetEvent());
//             },
//             child: Text("initial state")),
//       ]),
//     );
//   }
// }
