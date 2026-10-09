import 'package:flutter_application_1/core/enums/submission_status.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_application_1/feature/todo/ui/todo_details/bloc/todo_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'todo_details_state.dart';

class TodoDetailsCubit extends Cubit<TodoDetailsState> {
  final TodoRepository _repository;

  TodoDetailsCubit({required Todo todo, required this._repository})
    : super(TodoDetailsState(todo: todo));

  void updateTodoLocally(Todo updated) {
    emit(state.copyWith(todo: updated));
  }

  Future<void> toggleCompletion() async {
    final updatedStatus = state.todo.status.toggleComplete();
    final updatedTodo = state.todo.copyWith(status: updatedStatus);

    emit(state.copyWith(status: SubmissionStatus.loading));

    try {
      await _repository.updateTodo(updatedTodo);
      final msg = updatedStatus.isComplete
          ? 'Task marked as completed!'
          : 'Task marked as incomplete!';

      emit(
        state.copyWith(
          todo: updatedTodo,
          status: SubmissionStatus.success,
          successMessage: msg,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: 'Failed to update task: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> deleteTodo() async {
    emit(state.copyWith(status: SubmissionStatus.loading));

    try {
      await _repository.deleteTodo(state.todo.id);
      emit(
        state.copyWith(
          status: SubmissionStatus.success,
          isDeleted: true,
          successMessage: 'Task deleted successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: 'Failed to delete task: ${e.toString()}',
        ),
      );
    }
  }
}
