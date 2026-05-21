import 'package:flutter/material.dart';
import 'package:flutter_day1/models/model_task.dart';

class TodoModel extends ChangeNotifier {
  final List<ModelTask> _tasks = [];
  TaskFilter _filter = TaskFilter.all;

  TaskFilter get filter => _filter;

  int get activeCount => _tasks.where((task) => !task.isComplete).length;

  int get completedCount => _tasks.where((task) => task.isComplete).length;

  bool get hasCompleted => completedCount > 0;

  List<ModelTask> get filteredTask {
    return switch (_filter) {
      TaskFilter.all => List.unmodifiable(_tasks),
      TaskFilter.active => _tasks.where((task) => !task.isComplete).toList(),
      TaskFilter.completed => _tasks.where((task) => task.isComplete).toList(),
    };
  }

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _tasks.insert(
      0,
      ModelTask(
        id: DateTime.now().toString(),
        title: title.trim(),
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void removeTask(String id){
    _tasks.removeWhere((task) => task.id == id);
     notifyListeners();
  }

  void clearCompleted(){
    _tasks.removeWhere((task) => task.isComplete);
    notifyListeners();
  }

  void toggleTask(String id){
    final index = _tasks.indexWhere((task) => task.id ==id);
    if (index < 0 ) return;
    _tasks[index] = _tasks[index].copyWith(
      isComplete: !_tasks[index].isComplete
    );
    notifyListeners();
  }

  void setFilter(TaskFilter filter){
    if(_filter == filter) return;
    _filter = filter;
    notifyListeners();
  }


}
