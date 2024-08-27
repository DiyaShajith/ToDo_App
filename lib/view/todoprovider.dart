import 'package:flutter/material.dart';
import 'package:todo_app/view/modelview.dart';
import 'package:uuid/uuid.dart';
 // Ensure this file contains the Todo class

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  final Uuid uuid = Uuid();

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final todo = Todo(
      id: uuid.v4(),
      title: title,
    );
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(String id, String newTitle) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].title = newTitle;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodoCompletion(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      notifyListeners();
    }
  }
}
