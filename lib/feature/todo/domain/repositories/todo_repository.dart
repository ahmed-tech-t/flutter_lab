import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(int id);
}
