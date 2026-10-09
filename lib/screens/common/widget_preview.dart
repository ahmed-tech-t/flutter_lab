import 'package:flutter/material.dart';

class WidgetPreview extends StatelessWidget {
  final String title;
  final Widget child;

  const WidgetPreview({
    super.key,
     this.title ="",
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: child,
        ),
      ),
    );
  }
}