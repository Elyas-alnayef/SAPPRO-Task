part of 'search_cubit_cubit.dart';

@immutable
sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}
final class SearchCubitExistState extends SearchCubitState {
  final List<dynamic> hiveusers;
  SearchCubitExistState({required this.hiveusers});
}
final class SearchCubitNotExistState extends SearchCubitState {}



