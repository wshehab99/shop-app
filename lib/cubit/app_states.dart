abstract class AppStates {}

class InitialAppState extends AppStates {}

class LoadingState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {
  String error;
  LoginErrorState({required this.error});
}

class ChangePasswordVisablityState extends AppStates {}
