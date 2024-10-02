import 'package:flutter/material.dart';
import 'package:girman_technologies/gen/assets.gen.dart';

class AppTheme {
  static ThemeData get kTheme => ThemeData(
        fontFamily: Assets.fonts.poppins.poppinsRegular,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: const AppBarTheme(
          elevation: 10,
          backgroundColor: Colors.white,
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      );

  static const kScaffoldBodyStyle = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Color(0XFFB1CBFF),
      ],
    ),
  );

  static const Color kPrimaryColor = Color(0xff4786FF);
}
