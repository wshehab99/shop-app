import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/shop_login_model.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../models/change_favorites_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  bool showPassword = true;
  int currentIndex = 0;
  HomeModel? productModel;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavigationBarScreenState());
  }

  void login({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    DioHelper.postData(
            url: "login",
            data: {
              'email': email,
              "password": password,
            },
            lang: 'en')
        .then((value) {
      LoginModel model = LoginModel.fromJson(json: value.data);
      print(model.status);
      emit(LoginSuccessState(model: model));
    }).catchError((onError) {
      print(onError);
      emit(LoginErrorState(error: onError.toString()));
    });
  }

  void register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingState());
    DioHelper.postData(
            url: "register",
            data: {
              'email': email,
              "password": password,
              'name': name,
              'phone': phone,
            },
            lang: 'en')
        .then((value) {
      LoginModel model = LoginModel.fromJson(json: value.data);
      print(model.status);
      emit(LoginSuccessState(model: model));
    }).catchError((onError) {
      print(onError);
      emit(LoginErrorState(error: onError.toString()));
    });
  }

  void passwordPressed() {
    showPassword = !showPassword;
    emit(ChangePasswordVisablityState());
  }

  void getProducts() {
    emit(LoadingState());
    String? token;
    CacheHelper.getData(key: 'token').then((value) {
      token = value;
    });
    DioHelper.getData(url: 'home', token: token, lang: 'en').then((value) {
      productModel = HomeModel.fromJson(json: value.data);

      emit(GetProductsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetProductserrorState(error: error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    emit(LoadingState());
    String? token;
    CacheHelper.getData(key: 'token').then((value) {
      token = value;
    });
    DioHelper.getData(url: 'categories', token: token, lang: 'en')
        .then((value) {
      categoriesModel = CategoriesModel.fromJson(json: value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetCategorieserrorState(error: error.toString()));
    });
  }

  ChangeFavoritesModel? favoritesModel;
  void changeFavorite({required int productId}) {
    String? token;
    CacheHelper.getData(key: 'token').then((value) {
      token = value;
    });
    DioHelper.postData(
      url: "favorites",
      data: {
        'product_id': productId,
      },
      token: token,
      lang: 'en',
    ).then((value) {
      favoritesModel = ChangeFavoritesModel.fromJson(json: value.data);
      emit(ChangeFavoritesSuccessState());
      emit(state);
    }).catchError((onError) {
      print(onError.toString());
      emit(ChangeFavoritesErrorState(error: onError.toString()));
    });
  }
}
