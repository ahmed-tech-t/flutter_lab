import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/complete_Status.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/status_widget.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';
import 'package:flutter_application_1/utils/ext/responsive_extension.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;

  const TodoItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: todo.status.color.withAlpha(80),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Handle tap event
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CompleteStatus(status: todo.status),
                SizedBox(width: context.wp(4)),
                Expanded(child: _ItemInfo(todo: todo)),
                SizedBox(width: context.wp(4)),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          todo.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: decoration,
          ),
        ),
        SizedBox(height: context.hp(0.5)),
        Text(todo.body, style: TextStyle(fontSize: 14, decoration: decoration)),
        SizedBox(height: context.hp(1)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatusWidget(status: todo.status),
            const Spacer(),
            Text(todo.getDate(), style: const TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

// preview
void main() {
  runApp(
    WidgetPreview(
      child: Column(
        children: [
          TodoItemWidget(
            todo: Todo(
              title: "Buy groceries",
              status: Low(isComplete: true),
              body: 'Buy milk and eggs',
            ),
          ),
          TodoItemWidget(
            todo: Todo(
              title: "Buy groceries",
              status: Medium(isComplete: false),
              body: 'Buy milk and eggs',
            ),
          ),
        ],
      ),
    ),
  );
}
