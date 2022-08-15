import 'package:shop_app/models/shop_login_model.dart';

abstract class AppStates {}

class InitialAppState extends AppStates {}

class LoadingState extends AppStates {}

class LoginSuccessState extends AppStates {
  LoginModel model;
  LoginSuccessState({required this.model});
}

class LoginErrorState extends AppStates {
  String error;
  LoginErrorState({required this.error});
}

class ChangePasswordVisablityState extends AppStates {}

class ChangeNavigationBarScreenState extends AppStates {}

class GetProductsSuccessState extends AppStates {}

class GetProductserrorState extends AppStates {
  String error;
  GetProductserrorState({required this.error});
}

class GetCategoriesSuccessState extends AppStates {}

class GetCategorieserrorState extends AppStates {
  String error;
  GetCategorieserrorState({required this.error});
}

class ChangeFavoritesSuccessState extends AppStates {}

class ChangeFavoritesErrorState extends AppStates {
  String error;
  ChangeFavoritesErrorState({required this.error});
}
