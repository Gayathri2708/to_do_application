import 'package:get/get.dart';
import 'package:to_do_application/model/task_model.dart';

class ToDoController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isCompleted = false.obs;

  void addTask(String title, String description) {
    tasks.add(TaskModel(description: description, title: title));
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void editTask(String title, String description) {
    tasks.add(TaskModel(description: description, title: title));
  }

  void completedTasks(isDone) {
    isCompleted = isDone;
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    update();
  }
}
