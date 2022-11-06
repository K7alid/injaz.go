part of 'route_cubit.dart';

@immutable
abstract class RouteState {}

class RouteInitial extends RouteState {}

class GetRoutesDataLoadingState extends RouteState {}

class GetRoutesDataSuccessState extends RouteState {}

class GetRoutesDataErrorState extends RouteState {
  final String error;

  GetRoutesDataErrorState(this.error);
}
