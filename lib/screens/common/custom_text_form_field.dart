import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_decorations.dart';
import 'package:flutter_application_1/screens/common/section_header.dart';
import 'package:flutter_application_1/screens/common/widget_preview.dart';

/// App-wide reusable styled text field for forms.
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
        if (label != null) SectionHeader(label!),
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
          decoration: AppDecorations.inputDecoration(hintText: hintText),
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
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Title',
              hintText: 'e.g. Complete Flutter lab',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
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

