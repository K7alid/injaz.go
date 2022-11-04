import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/route_screen/model/route_model.dart';
import 'package:injaz_go/shared/network/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteInitial());

  static RouteCubit get(context) => BlocProvider.of(context);

  RouteModel? routeModel;

  void getRoutes() {
    emit(GetRoutesDataLoadingState());
    DioHelper.getData(
      url: 'api/route',
      query: {},
    ).then((value) {
      print('the data in home cubit is ${value.data}');
      routeModel = RouteModel.fromJson(value.data);
      print(routeModel?.tasks);
      emit(GetRoutesDataSuccessState());
    }).catchError((error) {
      print('the error in route cubit is $error');
      emit(GetRoutesDataErrorState(error.toString()));
    });
  }
}