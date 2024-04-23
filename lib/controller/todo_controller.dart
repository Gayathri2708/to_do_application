import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_application/model/model.dart';

class ToDoController extends GetxController {
  RxList tasks = [].obs;

  addTask(String title, String description) {
    tasks.add(Task(description: description, title: title));
  }
}
