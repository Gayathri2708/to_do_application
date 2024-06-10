import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/app_theme_colors.dart';
import 'package:to_do_application/constants/services/navigation_service.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/model/task_model.dart';

class EditTask extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ToDoController toDoController = Get.put(ToDoController());
  EditTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.appScaffoldColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppThemeColors.appThemeColor,
        title: const Text(
          "Edit Task",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              controller: textController,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              controller: descriptionController,
            ),
            const SizedBox(height: 40.0),
            Center(
              child: SizedBox(
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppThemeColors.appThemeColor,
                          elevation: 2.0,
                        ),
                        onPressed: () {
                          toDoController.editTask(
                              textController.text, descriptionController.text);
                          NavigationService.navigateBack();
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppThemeColors.appThemeColor,
                          elevation: 2.0,
                        ),
                        onPressed: () {
                          NavigationService.navigateBack();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
