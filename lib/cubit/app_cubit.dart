import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_states.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  bool showPassword = true;
  AppCubit(super.initialState);
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
    ).then((value) {
      emit(LoginSuccessState());
      print(value.data);
    }).catchError((onError) {
      print(onError);
      emit(LoginErrorState(error: onError.toString()));
    });
  }

  void passwordPressed() {
    showPassword = !showPassword;
    emit(ChangePasswordVisablityState());
  }
}
