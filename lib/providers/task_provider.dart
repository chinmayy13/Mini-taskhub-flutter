import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

class TaskProvider extends ChangeNotifier {
  final TaskService _service = TaskService();

  List<Task> tasks = [];
  bool loading = false;

  Future<void> loadTasks() async {
    loading = true;
    notifyListeners();

    tasks = await _service.fetchTasks();

    loading = false;
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    await _service.addTask(title);
    await loadTasks();
  }

  Future<void> toggle(Task task) async {
    await _service.toggleTask(task);
    await loadTasks();
  }

  Future<void> delete(String id) async {
    await _service.deleteTask(id);
    await loadTasks();
  }
}
