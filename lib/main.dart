import 'package:flutter/material.dart';
import 'package:shop_app/layout/screens/login_screen.dart';
import 'package:shop_app/layout/screens/shop_layout.dart';
import 'package:shop_app/modules/onboarding_screen.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool onBoarding = await CacheHelper.getData(key: "onBoarding") ?? false;
  String token = await CacheHelper.getData(key: "token") ?? '';
  DioHelper.init();
  runApp(MyApp(
    onBoarding: onBoarding,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.onBoarding, required this.token})
      : super(key: key);
  final bool onBoarding;
  final String token;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: lightThem,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: token.isNotEmpty
          ? ShopLayout()
          : onBoarding
              ? LoginScreen()
              : OnBoardinScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
