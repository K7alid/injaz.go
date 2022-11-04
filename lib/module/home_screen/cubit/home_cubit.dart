import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/home_screen/model/card_model.dart';
import 'package:injaz_go/shared/network/remote/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  CardModel? cardModel;
  List<dynamic> cards = [];

  void getCards() {
    emit(GetCardsDataLoadingState());
    DioHelper.getData(
      url: 'api/GetCards',
      query: {},
    ).then((value) {
      print('the data in home cubit is ${value.data}');
      print(value.data.runtimeType);
      cards = jsonDecode(value.data);
      print(cards[0].name);
      emit(GetCardsDataSuccessState());
    }).catchError((error) {
      print('the error in home cubit is $error');
      emit(GetCardsDataErrorState(error.toString()));
    });
  }
}
