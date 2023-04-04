import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';

class AppTheme {
  const AppTheme._();

  /// light theme start here ///

  static final lightTheme = ThemeData(
    fontFamily: "Alkatra",
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.kBlackColor2,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      color: AppColors.kWhiteColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColors.kBlackColor2,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.kBlackColor2,
      ),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.kWhiteColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.kBlackColor2,
        systemNavigationBarDividerColor: AppColors.kBlackColor2,
      ),
    ),
    primaryColor: AppColors.kPrimaryColor,
    secondaryHeaderColor: AppColors.kSecondaryColor,
    disabledColor: const Color(0xFFBABFC4),
    backgroundColor: AppColors.kBgColor,
    scaffoldBackgroundColor: AppColors.kWhiteColor,
    errorColor: const Color(0xFFE84D4F),
    brightness: Brightness.light,
    hintColor: const Color(0xFF808080),
    cardColor: AppColors.kWhiteColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      secondary: AppColors.kSecondaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.kPrimaryColor,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.kBlackColor2,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.25,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: AppColors.kBlackColor2,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.25,
        fontStyle: FontStyle.normal,
      ),
    ),
  );

  /// light theme end here ///

  /// dark theme start here ///

  static final darkTheme = ThemeData(
    fontFamily: "Alkatra",
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: AppColors.kCardDarkColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColors.kWhiteColor,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.kBlackColor2,
      ),
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.kCardDarkColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.kWhiteColor,
        systemNavigationBarDividerColor: AppColors.kWhiteColor,
      ),
    ),
    primaryColor: Colors.white,
    secondaryHeaderColor: AppColors.kSecondaryColor,
    disabledColor: const Color(0xffa2a7ad),
    backgroundColor: AppColors.kBgDarkColor,
    scaffoldBackgroundColor: AppColors.kBgDarkColor,
    errorColor: const Color(0xFFdd3135),
    brightness: Brightness.dark,
    hintColor: Colors.white,
    cardColor: AppColors.kCardDarkColor,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 1.25,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1.25,
          fontStyle: FontStyle.normal,
        )),
  );

  /// dark theme end here ///

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppColors.kWhiteColor
          : AppColors.kBgDarkColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light
      ? const Color(0x44948282)
      : const Color(0x441C2A3D);
}
