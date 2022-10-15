import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(AppInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  List<bool> isSelectedList = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];
  changeIconToggle(index) {
    for (int i = 0; i < 6; i++) {
      isSelectedList[i] = false;
    }
    isSelectedList[index] = true;
    emit(ChangeIconToggleState());
  }
}
