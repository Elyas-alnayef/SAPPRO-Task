import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/cubit/network_cubit.dart';
import 'package:task/cubit/user_cubit.dart';
import 'package:task/model/coordinates.dart';
import 'package:task/model/user.dart';

import 'cubit/search_cubit_cubit.dart';
import 'views/homepage.dart';
import 'model/address.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(CoordinatesAdapter());
  await Hive.openBox('useee');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
            create: (context) => UserCubit()..getallusres()),
        BlocProvider<SearchCubitCubit>(create: (context) => SearchCubitCubit()),
        BlocProvider<NetworkCubit>(
            create: (context) => NetworkCubit()..checkNetworkConnection()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homepage(),
      ),
    );
  }
}
