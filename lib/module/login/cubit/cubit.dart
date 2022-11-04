import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injaz_go/module/login/cubit/states.dart';
import 'package:injaz_go/module/login/model/login_model.dart';
import 'package:injaz_go/shared/network/local/cache_helper.dart';
import 'package:injaz_go/shared/network/remote/dio_helper.dart';

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

  LoginModel? loginModel;

  void userLogin({
    required String username,
    required String password,
  }) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: 'token',
      data: {
        'username': username,
        'password': password,
        'grant_type': 'password',
        'ali': 'ali',
      },
    ).then((value) {
      print(value.headers);
      loginModel = LoginModel.fromJson(value.data);
      print('the token is ${loginModel?.accessToken}');
      print('the token in the shared is ${CacheHelper.getData(key: 'tok')}');
      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('the error in login cubit is $error');
      emit(AppLoginErrorState(error.toString()));
    });
  }
}
