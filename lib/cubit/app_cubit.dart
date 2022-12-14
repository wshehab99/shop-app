import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/models/shop_login_model.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

import '../models/change_favorites_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  bool showPassword = true;
  int currentIndex = 0;
  HomeModel? productModel;
  List favorites = [];
  LoginModel? model;
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
      lang: 'en',
    ).then((value) {
      model = LoginModel.fromJson(json: value.data);
      print(model!.status);
      emit(LoginSuccessState(model: model!));
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
      model = LoginModel.fromJson(json: value.data);
      print(model!.status);
      emit(LoginSuccessState(model: model!));
    }).catchError((onError) {
      print(onError);
      emit(LoginErrorState(error: onError.toString()));
    });
  }

  void passwordPressed() {
    showPassword = !showPassword;
    emit(ChangePasswordVisablityState());
  }

  void getProducts() async {
    emit(LoadingState());
    String? token = await CacheHelper.getData(key: 'token');
    DioHelper.getData(url: 'home', token: token, lang: 'en').then((value) {
      productModel = HomeModel.fromJson(json: value.data);

      emit(GetProductsSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetProductserrorState(error: error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() async {
    emit(LoadingState());
    String? token = await CacheHelper.getData(key: 'token');
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
  void changeFavorite({
    required int productId,
  }) async {
    String token = await CacheHelper.getData(key: 'token') ?? '';
    Response response = await DioHelper.postData(
      url: "favorites",
      data: {
        'product_id': productId,
      },
      token: token,
      lang: 'en',
    );
    favoritesModel = ChangeFavoritesModel.fromJson(json: response.data);
    int index = productModel!.data!.products
        .indexWhere((element) => element.id == productId);
    productModel!.data!.products[index].isFavorite =
        !productModel!.data!.products[index].isFavorite!;
    favorites = productModel!.data!.products.where((product) {
      return product.isFavorite == true;
    }).toList();
    emit(ChangeFavoritesSuccessState());
  }

  void getFavorite() async {
    String? token = await CacheHelper.getData(key: 'token');
    Response response = await DioHelper.getData(
      url: "favorites",
      token: token,
      lang: 'en',
    ).catchError((onError) {
      print("error ${onError.toString()}");

      emit(ChangeFavoritesErrorState(error: onError.toString()));
    });

    FavoriteModel fav = FavoriteModel.fromJson(json: response.data);
    for (var element in fav.data!.data) {
      favorites.add(element.product);
    }

    emit(GetCategoriesSuccessState());
  }

  void getUseDetails() async {
    String? token = await CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url: "profile",
      token: token,
      lang: 'en',
    ).then((value) {
      model = LoginModel.fromJson(json: value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ChangeFavoritesErrorState(error: onError.toString()));
    });
  }

  void updateUseDetails({required Map<String, dynamic> data}) async {
    emit(LoadingState());
    String? token = await CacheHelper.getData(key: 'token');
    DioHelper.putData(
      url: "update-profile",
      data: data,
      token: token,
      lang: 'en',
    ).then((value) {
      model = LoginModel.fromJson(json: value.data);
      emit(GetCategoriesSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ChangeFavoritesErrorState(error: onError.toString()));
    });
  }

  Future<bool> logout() async {
    return await CacheHelper.deleteData(key: 'token');
  }

  SearchModel? searchModel;
  void searchProduct(String text) async {
    emit(LoadingState());
    String? token = await CacheHelper.getData(key: 'token');
    Response response = await DioHelper.postData(
        url: "products/search",
        token: token,
        lang: 'en',
        data: {'text': text}).catchError((onError) {
      print("error ${onError.toString()}");

      emit(ChangeFavoritesErrorState(error: onError.toString()));
    });

    searchModel = SearchModel.fromJson(json: response.data);

    emit(GetCategoriesSuccessState());
  }
}
