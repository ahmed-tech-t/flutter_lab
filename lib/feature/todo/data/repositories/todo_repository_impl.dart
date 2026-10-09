import 'package:flutter_application_1/core/database/hive_service.dart';
import 'package:flutter_application_1/feature/todo/data/mapper/todo_mapper.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Stream<List<Todo>> watchTodos() async* {
    final box = HiveService.todosBox;
    yield box.values.map((task) => task.toEntity()).toList();
    yield* box.watch().map((_) => box.values.map((task) => task.toEntity()).toList());
  }

  @override
  Future<List<Todo>> getTodos() async {
    final box = HiveService.todosBox;
    return box.values.map((task) => task.toEntity()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final box = HiveService.todosBox;
    final key = todo.id % 0xFFFFFFFF;
    await box.put(key, todo.toHiveModel());
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final box = HiveService.todosBox;
    final key = todo.id % 0xFFFFFFFF;
    await box.put(key, todo.toHiveModel());
  }

  @override
  Future<void> deleteTodo(int id) async {
    final box = HiveService.todosBox;
    final key = id % 0xFFFFFFFF;
    await box.delete(key);
  }
}

