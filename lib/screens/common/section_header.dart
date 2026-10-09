import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_spacing.dart';

/// App-wide reusable section title header widget with consistent typography.
class SectionHeader extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const SectionHeader(
    this.title, {
    super.key,
    this.padding = const EdgeInsets.only(bottom: AppSpacing.xs),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
