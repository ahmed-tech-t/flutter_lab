import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_status.dart';
import 'package:flutter_application_1/feature/todo/ui/widgets/status_widget.dart';

class PrioritySelectorWidget extends StatelessWidget {
  final TodoStatus selectedStatus;
  final ValueChanged<TodoStatus> onStatusSelected;

  const PrioritySelectorWidget({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  @override
  Widget build(BuildContext context) {
    final priorities = [Low(), Medium(), High()];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: priorities.map((status) {
        final isSelected = selectedStatus.runtimeType == status.runtimeType;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: InkWell(
              onTap: () => onStatusSelected(status),
              borderRadius: BorderRadius.circular(AppSpacing.lg),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(AppSpacing.xs),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  border: Border.all(
                    color: isSelected ? status.color : Colors.transparent,
                    width: 2.0,
                  ),
                  color: isSelected ? status.color.withAlpha(30) : Colors.transparent,
                ),
                child: Center(
                  child: StatusWidget(status: status),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
