import 'package:get/get.dart';
import 'package:to_do_application/model/model.dart';

class ToDoController extends GetxController {
  RxList tasks = [].obs;
  RxInt selectedIndex = 0.obs;

  void addTask(String title, String description) {
    tasks.add(Task(description: description, title: title));
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
