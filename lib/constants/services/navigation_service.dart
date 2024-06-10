import 'package:get/get.dart';

class NavigationService {
  static navigate(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static navigateAndReplace(String route, {dynamic arguments, dynamic result}) {
    Get.offAndToNamed(route, arguments: arguments, result: result);
  }

  static navigateBack() {
    Get.back();
  }
}
