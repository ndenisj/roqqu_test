import 'package:flutter/material.dart';

import 'main.dart';

void setAppThemeModeSetting(BuildContext context, ThemeMode themeMode) =>
    RoqquApp.of(context)!.setThemeMode(themeMode);
