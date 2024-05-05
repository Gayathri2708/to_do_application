import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/appThemeColors.dart';
import 'package:to_do_application/constants/images.dart';
import 'package:to_do_application/constants/routes/app_routes.dart';
import 'package:to_do_application/constants/services/navigation_service.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/widgets/addTasks.dart';

class ToDoView extends StatelessWidget {
  final ToDoController toDoController = Get.put(ToDoController());
  ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeColors.appScaffoldColor,
      appBar: AppBar(
        backgroundColor: appThemeColors.appThemeColor,
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
                  visualDensity: VisualDensity(horizontal: 0, vertical: -1.0),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                          color: appThemeColors.appThemeColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          size: 20,
                          color: appThemeColors.appThemeColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_circle,
                          size: 20,
                          color: appThemeColors.appThemeColor,
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    task.title,
                    style: const TextStyle(
                        color: appThemeColors.appThemeColor,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    task.description,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appThemeColors.appThemeColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          NavigationService().navigate(AppRoutes.addTasks);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: appThemeColors.appThemeColor,
            ),
            label: 'All',
            backgroundColor: appThemeColors.appThemeColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check,
                color: appThemeColors.appThemeColor,
              ),
              label: 'Completed',
              backgroundColor: appThemeColors.appThemeColor)
        ],
        currentIndex: toDoController.selectedIndex.value,
        onTap: (index) {
          toDoController.updateSelectedIndex(index);
        },
      ),
    );
  }
}
