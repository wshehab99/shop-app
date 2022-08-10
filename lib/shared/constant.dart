import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightThem = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20.0),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
  ),
);
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  scaffoldBackgroundColor: const Color.fromRGBO(51, 55, 57, 1),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(51, 55, 57, 1),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(51, 55, 57, 1),
        statusBarIconBrightness: Brightness.light),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.white,
      backgroundColor: Color.fromRGBO(51, 55, 57, 1),
      elevation: 20.0),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
  ),
);
