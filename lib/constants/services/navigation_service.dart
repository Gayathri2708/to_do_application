import 'package:get/get.dart';

class NavigationService {
  void navigate(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  void navigateAndReplace(String route, {dynamic arguments, dynamic result}) {
    Get.offAndToNamed(route, arguments: arguments, result: result);
  }

  void navigateBack() {
    Get.back();
  }
}
