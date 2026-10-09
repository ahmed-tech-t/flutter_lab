import 'package:flutter_application_1/core/enums/submission_status.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_application_1/feature/todo/ui/edit_task/bloc/edit_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final TodoRepository repository;
  final Todo initialTodo;

  EditTaskCubit({required this.initialTodo, required this.repository})
    : super(EditTaskState.fromTodo(initialTodo));

  void updateTitle(String title) {
    emit(state.copyWith(title: title, errorMessage: null));
  }

  void updateBody(String body) {
    emit(state.copyWith(body: body, errorMessage: null));
  }

  void updateStatus(TodoStatus status) {
    emit(state.copyWith(status: status));
  }

  void updateDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  Future<void> saveChanges() async {
    final title = state.title.trim();
    if (title.isEmpty) {
      emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.failure,
          errorMessage: 'Task title cannot be empty',
        ),
      );
      return;
    }

    emit(state.copyWith(submissionStatus: SubmissionStatus.loading));

    try {
      final updatedTodo = initialTodo.copyWith(
        title: title,
        body: state.body.trim(),
        status: state.status,
        date: state.date,
      );

      await repository.updateTodo(updatedTodo);
      emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.success,
          updatedTodo: updatedTodo,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          submissionStatus: SubmissionStatus.failure,
          errorMessage: 'Failed to update task: ${e.toString()}',
        ),
      );
    }
  }
}
