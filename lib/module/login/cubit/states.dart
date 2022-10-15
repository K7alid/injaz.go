abstract class LoginStates {}

class AppInitialState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccessState extends LoginStates {
  //LoginModel loginModel;
  //AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends LoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class ChangeIconToggleState extends LoginStates {}
