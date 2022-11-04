part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetDataLoadingState extends HomeState {}

class GetDataSuccessState extends HomeState {}

class GetDataErrorState extends HomeState {
  final String error;

  GetDataErrorState(this.error);
}
