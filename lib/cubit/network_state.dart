part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkInitial extends NetworkState {}
final class Connected extends NetworkState {}
final class NotConnected extends NetworkState {}

