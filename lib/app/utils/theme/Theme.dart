// ignore_for_file: file_names

import 'package:flutter/material.dart';

ThemeData? appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  cardColor: const Color.fromARGB(255, 18, 22, 32),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Color(0xFFFFE600),
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
    ),
    headline2: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    headline3: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
    subtitle2: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Colors.white,
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Color(0xFFFFE600),
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
    ),
    caption: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Color(0xFFF0F0F5),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
  ),
  primaryColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFF171C2A),
  backgroundColor: const Color(0xFF171C2A),
  hintColor: const Color(0xFFFFE600),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF000000),
    shadowColor: Colors.white,
    elevation: 0.0,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFFF0F0F5),
    unselectedLabelColor: Color(0xFFe0e0e0),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Color(0xFFF0F0F5),
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    labelStyle: TextStyle(
      fontFamily: 'SourceSansPro',
      color: Color(0xFFF0F0F5),
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
  ),
);
