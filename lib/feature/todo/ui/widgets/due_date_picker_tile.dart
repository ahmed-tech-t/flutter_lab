import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/core/theme/app_decorations.dart';
import 'package:flutter_application_1/screens/common/app_date_picker.dart';
import 'package:intl/intl.dart';

/// Reusable due date tile with date picker trigger used across Todo screens.
class DueDatePickerTile extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateChanged;
  final bool enabled;

  const DueDatePickerTile({
    super.key,
    required this.selectedDate,
    this.onDateChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isInteractive = enabled && onDateChanged != null;
    final date = selectedDate ?? DateTime.now();

    return InkWell(
      onTap: isInteractive
          ? () async {
              final picked = await AppDatePicker.pickDate(
                context,
                initialDate: date,
              );
              if (picked != null) {
                onDateChanged!(picked);
              }
            }
          : null,
      borderRadius: BorderRadius.circular(AppSpacing.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: AppDecorations.cardDecoration(),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, size: 20, color: Colors.white),
            const SizedBox(width: AppSpacing.md),
            Text(
              selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : 'No due date',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            if (isInteractive) ...[
              const Spacer(),
              const Icon(Icons.arrow_drop_down, color: Colors.white70),
            ],
          ],
        ),
      ),
    );
  }
}
