import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/complete_Status.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/status_widget.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onTap;
  final VoidCallback? onMorePressed;

  const TodoItemWidget({
    super.key,
    required this.todo,
    this.onTap,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppSpacing.cardMargin,
      color: todo.status.color.withAlpha(50),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.lg)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: AppSpacing.cardPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CompleteStatus(status: todo.status),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: _ItemInfo(todo: todo)),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: onMorePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemInfo extends StatelessWidget {
  final Todo todo;

  const _ItemInfo({required this.todo});

  @override
  Widget build(BuildContext context) {
    final decoration = todo.status.isComplete
        ? TextDecoration.lineThrough
        : null;

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          todo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: decoration,
              ) ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: decoration,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          todo.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black87,
                decoration: decoration,
              ) ??
              TextStyle(fontSize: 14, decoration: decoration),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            StatusWidget(status: todo.status),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                todo.getDate(),
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Preview
void main() {
  runApp(
    WidgetPreview(
      child: Column(
        children: [
          TodoItemWidget(
            todo: Todo(
              title: "Buy groceries",
              status: Low(isComplete: true),
              body: 'Buy milk, eggs, bread and fresh fruits',
            ),
          ),
          TodoItemWidget(
            todo: Todo(
              title: "Finish Flutter project",
              status: Medium(isComplete: false),
              body: 'Implement Bloc architecture and production-ready UI components',
            ),
          ),
        ],
      ),
    ),
  );
}
