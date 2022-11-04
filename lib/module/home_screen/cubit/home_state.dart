part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCardsDataLoadingState extends HomeState {}

class GetCardsDataSuccessState extends HomeState {}

class GetCardsDataErrorState extends HomeState {
  final String error;

  GetCardsDataErrorState(this.error);
}
