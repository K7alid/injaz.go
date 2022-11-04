import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/home_screen/model/card_model.dart';
import 'package:injaz_go/shared/network/remote/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  CardModel? cardModel;
  List<CardModel> cards = [];

  void getCards() {
    emit(GetDataLoadingState());
    DioHelper.getData(
      url: 'api/GetCards',
      query: {},
    ).then((value) {
      print('the data in home cubit is ${value}');
      print(value.runtimeType);
      print(CardModel.fromJson(value[0]));
      CardModel go = CardModel.fromJson(value[0]);
      print(go.name);
      // cards = List<CardModel>.fromJson(json.encode(value));
    }).catchError((error) {
      print('the error  $error');
      emit(GetDataErrorState(error.toString()));
    });
  }
}
