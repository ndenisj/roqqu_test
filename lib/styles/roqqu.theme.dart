import 'package:flutter/material.dart';
import 'package:roqqu_test/constants.dart';
import 'package:roqqu_test/styles/dark.theme.dart';
import 'package:roqqu_test/styles/light.theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class RoqquTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static RoqquTheme of(BuildContext context) {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return darkMode == null
        ? brightness == Brightness.dark
            ? DarkModeTheme()
            : LightModeTheme()
        : darkMode
            ? DarkModeTheme()
            : LightModeTheme();
  }

  Color? primaryColor;
  Color? secondaryColor;
  Color? alternate;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;
  Color? primaryBtnText;
  Color? activeTabColor;
  Color? inputBorderColor;
  Color? lineColor;

  TextStyle get title1 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 34,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  TextStyle get title3 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  TextStyle get bodyText1 => TextStyle(
        fontFamily: roqquFontFamily,
        color: primaryText,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );
  TextStyle get bodyText2 => TextStyle(
        fontFamily: roqquFontFamily,
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyText3 => TextStyle(
        fontFamily: roqquFontFamily,
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}
