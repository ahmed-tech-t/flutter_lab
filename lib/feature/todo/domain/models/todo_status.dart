import 'package:flutter/material.dart';

sealed class TodoStatus {
  final Color color;
  final String value;
  final bool isComplete;
  
  TodoStatus({required this.color, required this.value, required this.isComplete}); 

  TodoStatus toggleComplete() {
    final next = !isComplete;
    return switch (this) {
      Low() => Low(isComplete: next),
      Medium() => Medium(isComplete: next),
      High() => High(isComplete: next),
    };
  }
}

final class Low extends TodoStatus {
  Low({super.color = Colors.green, super.value = "Low", super.isComplete = false});
}

final class Medium extends TodoStatus {
  Medium({super.color = Colors.orange, super.value = "Medium", super.isComplete = false});
}

final class High extends TodoStatus {
  High({super.color = Colors.red, super.value = "High", super.isComplete = false});
}