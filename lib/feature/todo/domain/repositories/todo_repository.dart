import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';

abstract interface class TodoRepository {
  Stream<List<Todo>> watchTodos();
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(int id);
}
