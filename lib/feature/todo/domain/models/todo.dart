import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:intl/intl.dart';

class Todo {
  final int id;
  final String title;
  final String body;
  final DateTime? date;
  final TodoStatus status;

  Todo({
    int? id,
    required this.body,
    required this.title,
    required this.status,
    this.date,
  }) : id = (id ?? DateTime.now().microsecondsSinceEpoch) % 0xFFFFFFFF;

  String getDate() {
    final d = date ?? DateTime.now();
    return DateFormat('dd/MM/yyyy').format(d);
  }

  Todo copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? date,
    TodoStatus? status,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}
