import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/counter/counter_screen.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "first App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CounterScreen(),
      ),
    );
  }
}
