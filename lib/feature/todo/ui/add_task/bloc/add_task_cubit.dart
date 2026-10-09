import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/bloc/add_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final TodoRepository _repository;

  AddTaskCubit(this._repository) : super(AddTaskState.initial());

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

  Future<void> submitTask() async {
    final title = state.title.trim();
    if (title.isEmpty) {
      emit(
        state.copyWith(
          submissionStatus: TaskSubmissionStatus.failure,
          errorMessage: 'Task title cannot be empty',
        ),
      );
      return;
    }

    emit(state.copyWith(submissionStatus: TaskSubmissionStatus.loading));

    try {
      final newTodo = Todo(
        title: title,
        body: state.body.trim(),
        status: state.status,
        date: state.date,
      );

      await _repository.addTodo(newTodo);
      emit(state.copyWith(submissionStatus: TaskSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          submissionStatus: TaskSubmissionStatus.failure,
          errorMessage: 'Failed to save task: ${e.toString()}',
        ),
      );
    }
  }
}
