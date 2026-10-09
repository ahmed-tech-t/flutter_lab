import 'package:flutter_application_1/feature/todo/data/models/todo_hive_model.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';

extension TodoToHiveModel on Todo {
  TodoHiveModel toHiveModel() {
    final statusKey = switch (status) {
      Low() => 'low',
      Medium() => 'medium',
      High() => 'high',
    };

    return TodoHiveModel(
      id: id,
      title: title,
      body: body,
      statusName: statusKey,
      dateMillis: date?.millisecondsSinceEpoch,
      isCompleted: status.isComplete,
    );
  }
}

extension TodoHiveModelToEntity on TodoHiveModel {
  Todo toEntity() {
    final TodoStatus status = switch (statusName) {
      'medium' => Medium(isComplete: isCompleted),
      'high' => High(isComplete: isCompleted),
      _ => Low(isComplete: isCompleted),
    };

    return Todo(
      id: id,
      title: title,
      body: body,
      status: status,
      date: dateMillis != null
          ? DateTime.fromMillisecondsSinceEpoch(dateMillis!)
          : null,
    );
  }
}

