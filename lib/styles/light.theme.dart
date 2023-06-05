import 'package:flutter/material.dart';
import 'package:roqqu_test/styles/roqqu.colors.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

class LightModeTheme extends RoqquTheme {
  @override
  Color? primaryColor = lightPrimaryColor;
  @override
  Color? secondaryColor = lightSecondaryColor;
  @override
  Color? alternate = positiveColor;
  @override
  Color? primaryBackground = lightScaffoldColor;
  @override
  Color? secondaryBackground = lightSecondaryColor;
  @override
  Color? primaryText = lightPrimaryText;
  @override
  Color? secondaryText = lightSecondaryText;
  @override
  Color? activeTabColor = lightActiveTabColor;
  @override
  Color? inputBorderColor = lightInputBorderColor;
  @override
  Color? primaryBtnText = const Color(0xFFFFFFFF);
  @override
  Color? lineColor = lightSecondaryColor;
}

ThemeData lightTheme(context) {
  return ThemeData(
    brightness: Brightness.light,
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
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: RoqquTheme.of(context).inputBorderColor!),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: RoqquTheme.of(context).inputBorderColor!),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: RoqquTheme.of(context).inputBorderColor!),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
