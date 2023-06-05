import 'package:get/get.dart';
import 'package:roqqu_test/services/logger.dart';

class HomeController extends GetxController {
  Logger logger = Logger('HomeControler');

  @override
  void onInit() {
    logger.log('Controller initialized');
    super.onInit();
  }

  @override
  void dispose() {
    logger.log('Controller disposed');
    super.dispose();
  }
}
