import 'package:get/get.dart';
import 'package:to_do_application/constants/routes/app_routes.dart';
import 'package:to_do_application/widgets/pages/edit_tasks.dart';
import 'package:to_do_application/widgets/pages/todo_view.dart';
import 'package:to_do_application/widgets/pages/add_task.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => ToDoView()),
    GetPage(name: AppRoutes.addTask, page: () => AddTask()),
    GetPage(name: AppRoutes.editTask, page: () => EditTask()),
  ];
}
