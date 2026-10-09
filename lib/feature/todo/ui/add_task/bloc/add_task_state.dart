import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';

enum TaskSubmissionStatus { initial, loading, success, failure }

class AddTaskState extends Equatable {
  final String title;
  final String body;
  final TodoStatus status;
  final DateTime date;
  final TaskSubmissionStatus submissionStatus;
  final String? errorMessage;

  const AddTaskState({
    this.title = '',
    this.body = '',
    required this.status,
    required this.date,
    this.submissionStatus = TaskSubmissionStatus.initial,
    this.errorMessage,
  });

  factory AddTaskState.initial() {
    return AddTaskState(status: Low(), date: DateTime.now());
  }

  AddTaskState copyWith({
    String? title,
    String? body,
    TodoStatus? status,
    DateTime? date,
    TaskSubmissionStatus? submissionStatus,
    String? errorMessage,
  }) {
    return AddTaskState(
      title: title ?? this.title,
      body: body ?? this.body,
      status: status ?? this.status,
      date: date ?? this.date,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    title,
    body,
    status,
    date,
    submissionStatus,
    errorMessage,
  ];
}
