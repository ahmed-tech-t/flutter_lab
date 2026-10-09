import 'dart:ffi';

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
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  String getDate() {
    DateTime now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now); // 08/10/2026
  }
}
