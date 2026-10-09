import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';

/// Pill badge widget displaying the priority status (Low, Medium, High).
class StatusWidget extends StatelessWidget {
  final TodoStatus status;

  const StatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status.color.withAlpha(80),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: status.color, width: 1.5),
      ),
      child: Text(
        status.value,
        style: TextStyle(
          color: status.color,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    WidgetPreview(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatusWidget(status: Low()),
          const SizedBox(width: 12),
          StatusWidget(status: Medium()),
          const SizedBox(width: 12),
          StatusWidget(status: High()),
        ],
      ),
    ),
  );
}
