import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/app_theme_colors.dart';
import 'package:to_do_application/constants/services/navigation_service.dart';
import 'package:to_do_application/controller/todo_controller.dart';

class CompletedTask extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ToDoController toDoController = Get.put(ToDoController());

  CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          backgroundColor: AppThemeColors.appThemeColor,
          title: const Text(
            "Completed Task",
            style: TextStyle(color: Colors.white),
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
                  ),
                ),
              );
            },
          ),
        ));
  }
}
