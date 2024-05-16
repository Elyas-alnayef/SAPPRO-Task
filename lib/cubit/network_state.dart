part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}

//when there is internet connection
final class Connected extends NetworkState {}

//when there is no internet connection
final class NotConnected extends NetworkState {}
