class TaskModel {
  String title;
  String description;
  bool isDone;
  TaskModel(
      {required this.description, required this.title, this.isDone = false});
}
