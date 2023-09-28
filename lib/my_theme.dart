import 'package:flutter/material.dart';

class MyTheme {
  /// ha7ot hna el colors, el light mode, el dark mode
  static Color primaryLight = Color(0xffB7935F);
  static Color primarydark = Color(0xff141A2E);

  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffffffff);
  static Color yellowColor = Color(0xffFACC1D);

////////////////////////////////////////////////////////// colors
  static ThemeData lightMode = ThemeData(
    //canvasColor: primaryLight,
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: blackColor),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        unselectedItemColor: whiteColor,
        showUnselectedLabels: true),

    /// de mas2ola 3n el text elly fo2 bta3t اسلامي
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darktMode = ThemeData(
    //canvasColor: primaryLight,
    primaryColor: primarydark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: whiteColor),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
        showUnselectedLabels: true),

    /// de mas2ola 3n el text elly fo2 bta3t اسلامي
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 30, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          color: yellowColor, fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
