import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/ext/responsive_extension.dart';
import 'package:get/get.dart';

class CounterText extends StatelessWidget {
  final int counter;
  const CounterText({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: context.hp(20),
      width: context.wp(20),
      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
      child: Center(
        child: Text(
          counter.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

