import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/theme/theme_states.dart';

import '../shared/constant.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit(super.initialState);
  ThemeData lightMode = lightThem;
  ThemeData darkMode = darkTheme;
  bool isDark = ThemeMode.system == ThemeMode.dark;

  void changeThemeMode({required bool dark}) {
    isDark = dark;
    emit(ChangeThemeModeState());
  }
}
