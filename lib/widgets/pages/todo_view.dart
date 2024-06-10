import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/app_theme_colors.dart';
import 'package:to_do_application/constants/images.dart';
import 'package:to_do_application/constants/routes/app_routes.dart';
import 'package:to_do_application/constants/services/navigation_service.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/widgets/pages/add_task.dart';

class ToDoView extends StatelessWidget {
  final ToDoController toDoController = Get.put(ToDoController());
  ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.appScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppThemeColors.appThemeColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "ToDo App",
              style: TextStyle(color: Colors.white),
            ),
            SvgPicture.asset(Images.calendar, height: 60)
          ],
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: toDoController.tasks.length,
          itemBuilder: (context, index) {
            final task = toDoController.tasks[index];
            return Center(
              child: Card(
                elevation: 3.0,
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: 0, vertical: -1.0),
                  title: Text(
                    task.title,
                    style: const TextStyle(
                        color: AppThemeColors.appThemeColor,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    task.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          NavigationService.navigate(AppRoutes.editTask,
                              arguments: toDoController.tasks[index]);
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                          color: AppThemeColors.appThemeColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          toDoController.deleteTask(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                          color: AppThemeColors.appThemeColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          toDoController.completedTasks(true);
                          Colors.green;
                        },
                        icon: const Icon(
                          Icons.check_circle,
                          size: 20,
                          color: AppThemeColors.appThemeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppThemeColors.appThemeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          NavigationService.navigate(AppRoutes.addTask);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: AppThemeColors.appThemeColor,
            ),
            label: 'All',
            backgroundColor: AppThemeColors.appThemeColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check,
                color: AppThemeColors.appThemeColor,
              ),
              label: 'Completed',
              backgroundColor: AppThemeColors.appThemeColor)
        ],
        currentIndex: toDoController.selectedIndex.value,
        onTap: (index) {
          toDoController.updateSelectedIndex(index);
        },
      ),
    );
  }
}
