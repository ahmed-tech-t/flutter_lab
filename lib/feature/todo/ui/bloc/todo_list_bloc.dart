import 'package:equatable/equatable.dart';

import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_filter.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Cubit<TodoListState> {
  final TodoRepository _repository;

  TodoListBloc(this._repository) : super(Initial()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    emit(Loading());
    try {
      final todos = await _repository.getTodos();
      emit(Success(todos, TodoFilter.all));
    } catch (e) {
      emit(Error("Failed to load tasks: ${e.toString()}"));
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _repository.addTodo(todo);
      await loadTodos();
    } catch (e) {
      emit(Error("Failed to add task: ${e.toString()}"));
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _repository.deleteTodo(id);
      await loadTodos();
    } catch (e) {
      emit(Error("Failed to delete task: ${e.toString()}"));
    }
  }
}
