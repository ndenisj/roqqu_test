// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:roqqu_test/app_bindings.dart';
import 'package:roqqu_test/app_links.dart';
import 'package:roqqu_test/routes.dart';
import 'package:roqqu_test/styles/dark.theme.dart';
import 'package:roqqu_test/styles/light.theme.dart';
import 'package:roqqu_test/styles/roqqu.theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RoqquTheme.initialize();

  runApp(const RoqquApp());
}

class RoqquApp extends StatefulWidget {
  const RoqquApp({super.key});

  @override
  State<RoqquApp> createState() => _RoqquAppState();

  static _RoqquAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_RoqquAppState>();
}

class _RoqquAppState extends State<RoqquApp> {
  ThemeMode _themeMode = RoqquTheme.themeMode;
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        RoqquTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1137),
      builder: (context, child) => GetMaterialApp(
        title: 'Roqqu',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        themeMode: _themeMode,
        initialBinding: AppBindings(),
        initialRoute: AppLinks.home,
        getPages: AppRoutes.pages,
        onInit: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        },
      ),
    );
  }
}
