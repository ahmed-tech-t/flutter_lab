import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  final int counter;
  const CounterText({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Text(
        counter.toString(),
        style: TextStyle(backgroundColor: Colors.white),
      ),
    );
  }
}

