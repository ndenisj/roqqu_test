import 'package:flutter/material.dart';

import 'main.dart';

void setAppThemeModeSetting(BuildContext context, ThemeMode themeMode) =>
    RoqquApp.of(context)!.setThemeMode(themeMode);

String getBinanaceKlinesUri(
    {required String symbol, required String interval, int? endTime}) {
  return "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval" +
      (endTime != null ? "&endTime=$endTime" : "");
}
