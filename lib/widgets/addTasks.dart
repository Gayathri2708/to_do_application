import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/todo_controller.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ToDoController toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Task title',
              ),
              controller: textController,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Task description',
              ),
              controller: descriptionController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                toDoController.addTask(
                  textController.text,
                  descriptionController.text,
                );
                Get.back(); // Navigate back to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
