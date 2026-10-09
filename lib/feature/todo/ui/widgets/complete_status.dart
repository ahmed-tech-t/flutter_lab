import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';

/// Circular completion check indicator widget.
class CompleteStatus extends StatelessWidget {
  final TodoStatus status;

  const CompleteStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return CompleteStatusContainerWidget(
      color: status.color,
      isTransparent: true,
      child: status.isComplete
          ? CompleteStatusContainerWidget(
              size: const Size(20, 20),
              color: status.color,
              child: const Icon(Icons.check, color: Colors.white, size: 15),
            )
          : const CompleteStatusContainerWidget(
              color: Colors.black,
              size: Size(20, 20),
              isTransparent: true,
            ),
    );
  }
}

class CompleteStatusContainerWidget extends StatelessWidget {
  final Size size;
  final Widget? child;
  final Color color;
  final bool isTransparent;

  const CompleteStatusContainerWidget({
    super.key,
    this.size = const Size(40, 40),
    this.child,
    required this.color,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
        color: isTransparent ? Colors.transparent : color,
      ),
      child: Center(child: child),
    );
  }
}

void main() {
  runApp(WidgetPreview(child: CompleteStatus(status: High())));
}
