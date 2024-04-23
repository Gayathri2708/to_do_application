import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/controller/todo_controller.dart';
import 'package:to_do_application/widgets/addTasks.dart';

class ToDoView extends StatelessWidget {
  final ToDoController toDoController = Get.put(ToDoController());
  ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Center(
          child: Text(
            "ToDo App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: toDoController.tasks.length,
          itemBuilder: (context, index) {
            final task = toDoController.tasks[index];
            return ListTile(
              title: Text(
                task.title,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                task.description,
                style: TextStyle(color: Colors.black),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(AddTaskScreen());
        },
      ),
    );
  }
}
