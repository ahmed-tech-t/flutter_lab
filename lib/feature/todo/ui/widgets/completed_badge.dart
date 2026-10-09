import 'package:flutter/material.dart';

/// Pill badge indicating task completion status.
class CompletedBadge extends StatelessWidget {
  const CompletedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(50),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green, width: 1.2),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, size: 14, color: Colors.green),
          SizedBox(width: 4),
          Text(
            'Completed',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
