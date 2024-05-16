part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {
  final List<dynamic> hiveusers;
  UserInitial({required this.hiveusers});
}

final class Errorstate extends UserState {
  final String error;

  Errorstate({required this.error});
}

final class Successgetstate extends UserState {
  final List<dynamic> hiveusers;
  final bool internetstate;

  Successgetstate({required this.hiveusers, required this.internetstate});
}
