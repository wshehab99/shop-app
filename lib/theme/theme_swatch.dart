import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/theme/theme_cubit.dart';
import 'package:shop_app/theme/theme_states.dart';

class ThemeSwatch extends StatelessWidget {
  const ThemeSwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(builder: ((context, state) {
      ThemeCubit themeCubit = context.read<ThemeCubit>();
      return Switch.adaptive(
          value: themeCubit.isDark,
          onChanged: (value) {
            themeCubit.changeThemeMode(dark: value);
          });
    }));
  }
}
