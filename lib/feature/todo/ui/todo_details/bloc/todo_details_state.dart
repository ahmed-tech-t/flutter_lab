import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enums/submission_status.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';

class TodoDetailsState extends Equatable {
  final Todo todo;
  final SubmissionStatus status;
  final bool isDeleted;
  final String? errorMessage;
  final String? successMessage;

  const TodoDetailsState({
    required this.todo,
    this.status = SubmissionStatus.initial,
    this.isDeleted = false,
    this.errorMessage,
    this.successMessage,
  });

  TodoDetailsState copyWith({
    Todo? todo,
    SubmissionStatus? status,
    bool? isDeleted,
    String? errorMessage,
    String? successMessage,
  }) {
    return TodoDetailsState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [
        todo,
        status,
        isDeleted,
        errorMessage,
        successMessage,
      ];
}

