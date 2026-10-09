import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final int maxLines;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextFormField(
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          onChanged: onChanged,
          validator: validator,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: Colors.blueAccent,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withAlpha(120)),
            filled: true,
            fillColor: Colors.white.withAlpha(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              borderSide: BorderSide(color: Colors.white.withAlpha(50)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              borderSide: BorderSide(color: Colors.white.withAlpha(50)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.md),
              borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

// Preview
void main() {
  runApp(
    WidgetPreview(
      title: 'CustomTextFormField Preview',
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextFormField(
              label: 'Title',
              hintText: 'e.g. Complete Flutter lab',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              label: 'Description',
              hintText: 'Add details...',
              maxLines: 3,
            ),
          ],
        ),
      ),
    ),
  );
}
