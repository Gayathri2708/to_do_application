import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/constants/appThemeColors.dart';
import 'package:to_do_application/constants/services/navigation_service.dart';
import 'package:to_do_application/controller/todo_controller.dart';

class AddTasks extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ToDoController toDoController = Get.put(ToDoController());

  AddTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: appThemeColors.appThemeColor,
        title: const Text(
          "Add Task",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: appThemeColors.appThemeColor,
                    elevation: 2.0,
                  ),
                  onPressed: () {
                    toDoController.addTask(
                      textController.text,
                      descriptionController.text,
                    );
                    NavigationService().navigateBack();
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
