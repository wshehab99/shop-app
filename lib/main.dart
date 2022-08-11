import 'package:flutter/material.dart';
import 'package:shop_app/modules/onboarding_screen.dart';
import 'package:shop_app/shared/constant.dart';
import 'package:shop_app/shared/local/cache_helper.dart';
import 'package:shop_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: lightThem,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: OnBoardinScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
