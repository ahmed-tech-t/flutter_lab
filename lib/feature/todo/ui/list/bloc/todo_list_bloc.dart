import 'dart:async';
import 'package:equatable/equatable.dart';

import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_filter.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Cubit<TodoListState> {
  final TodoRepository _repository;
  StreamSubscription<List<Todo>>? _todosSubscription;

  TodoListBloc(this._repository) : super(Initial()) {
    _subscribeToTodos();
  }

  void _subscribeToTodos() {
    emit(Loading());
    _todosSubscription = _repository.watchTodos().listen(
      (todos) {
        emit(Success(todos, TodoFilter.all));
      },
      onError: (error) {
        emit(Error("Failed to load tasks: ${error.toString()}"));
      },
    );
  }

  Future<void> addTodo(Todo todo) async {
    try {
      await _repository.addTodo(todo);
    } catch (e) {
      emit(Error("Failed to add task: ${e.toString()}"));
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      await _repository.deleteTodo(id);
    } catch (e) {
      emit(Error("Failed to delete task: ${e.toString()}"));
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
