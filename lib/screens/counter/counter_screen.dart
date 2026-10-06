
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/common/CElevatedButton.dart';
import 'package:flutter_application_1/screens/counter/widgets/counter_text.dart';

class CounterScreen extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 1, 28),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(25),
              ),
    
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      CElevatedButton(icon: Icons.add, onPressed: () {}),
                      CounterText(counter: 40),
                      CElevatedButton(icon: Icons.remove, onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            // ElevatedButton(onPressed: () {}, child: Text("Reset")),
          ],
        ),
      ),
    );
  }
}

