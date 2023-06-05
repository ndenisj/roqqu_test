import 'package:get/get.dart';
import 'package:roqqu_test/screens/home/home.screen.dart';

import 'app_links.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppLinks.home,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
  ];
}
