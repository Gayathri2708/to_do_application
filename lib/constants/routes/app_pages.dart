import 'package:get/get.dart';
import 'package:to_do_application/constants/routes/app_routes.dart';
import 'package:to_do_application/page/todo_view.dart';
import 'package:to_do_application/widgets/addTasks.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => ToDoView()),
    GetPage(name: AppRoutes.addTasks, page: () => AddTasks()),
  ];
}
