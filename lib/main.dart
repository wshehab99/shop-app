import 'package:flutter/material.dart';
import 'package:shop_app/layout/screens/login_screen.dart';
import 'package:shop_app/modules/onboarding_screen.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool onBoarding = await CacheHelper.getData(key: "onBoarding") ?? false;
  DioHelper.init();
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.onBoarding}) : super(key: key);
  final bool onBoarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: lightThem,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: onBoarding ? LoginScreen() : OnBoardinScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
