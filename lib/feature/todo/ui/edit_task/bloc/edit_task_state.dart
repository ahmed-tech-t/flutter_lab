import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/enums/submission_status.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';

class EditTaskState extends Equatable {
  final int id;
  final String title;
  final String body;
  final TodoStatus status;
  final DateTime date;
  final SubmissionStatus submissionStatus;
  final String? errorMessage;
  final Todo? updatedTodo;

  const EditTaskState({
    required this.id,
    required this.title,
    required this.body,
    required this.status,
    required this.date,
    this.submissionStatus = SubmissionStatus.initial,
    this.errorMessage,
    this.updatedTodo,
  });

  factory EditTaskState.fromTodo(Todo todo) {
    return EditTaskState(
      id: todo.id,
      title: todo.title,
      body: todo.body,
      status: todo.status,
      date: todo.date ?? DateTime.now(),
    );
  }

  EditTaskState copyWith({
    String? title,
    String? body,
    TodoStatus? status,
    DateTime? date,
    SubmissionStatus? submissionStatus,
    String? errorMessage,
    Todo? updatedTodo,
  }) {
    return EditTaskState(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      status: status ?? this.status,
      date: date ?? this.date,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      updatedTodo: updatedTodo ?? this.updatedTodo,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        status,
        date,
        submissionStatus,
        errorMessage,
        updatedTodo,
      ];
}

