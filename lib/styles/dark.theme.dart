import 'package:flutter/material.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

class DarkModeTheme extends RoqquTheme {
  @override
  Color? primaryColor = darkPrimaryColor;
  @override
  Color? secondaryColor = darkSecondaryColor;
  @override
  Color? alternate = positiveColor;
  @override
  Color? primaryBackground = darkScaffoldColor;
  @override
  Color? secondaryBackground = darkSecondaryColor;
  @override
  Color? primaryText = darkPrimaryText;
  @override
  Color? secondaryText = darkSecondaryText;
  @override
  Color? activeTabColor = darkActiveTabColor.withOpacity(0.9);
  @override
  Color? inputBorderColor = darkInputBorderColor;

  @override
  Color? primaryBtnText = const Color(0xFFFFFFFF);
  @override
  Color? lineColor = darkSecondaryColor;
}

ThemeData darkTheme(context) {
  return ThemeData(
    brightness: Brightness.dark,
    // useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: RoqquTheme.of(context).primaryBackground,
    primaryColor: RoqquTheme.of(context).primaryColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: RoqquTheme.of(context).secondaryBackground,
    ),
    textTheme: TextTheme(
      bodyLarge: RoqquTheme.of(context).bodyText1,
      bodyMedium: RoqquTheme.of(context).bodyText2,
      bodySmall: RoqquTheme.of(context).bodyText3,
      titleLarge: RoqquTheme.of(context).title1,
      titleMedium: RoqquTheme.of(context).title2,
      titleSmall: RoqquTheme.of(context).title3,
      displayMedium: RoqquTheme.of(context).subtitle1,
      displaySmall: RoqquTheme.of(context).subtitle2,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.2,
      iconTheme: const IconThemeData(),
      titleTextStyle: RoqquTheme.of(context).subtitle1,
      backgroundColor: RoqquTheme.of(context).primaryBackground,
    ),
    tabBarTheme: TabBarTheme(),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(8),
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
  );
}
