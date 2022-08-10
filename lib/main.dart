import 'package:flutter/material.dart';
import 'package:shop_app/modules/onboarding_screen.dart';
import 'package:shop_app/shared/constant.dart';

void main() {
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
      themeMode: ThemeMode.dark,
      home: OnBoardinScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
