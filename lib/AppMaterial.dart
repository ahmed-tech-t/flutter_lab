import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "first App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.amber,
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
                          Counter(counter: 40),
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
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int counter;
  const Counter({super.key, required this.counter});

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

class CElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const CElevatedButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
      ),
      child: Icon(icon),
    );
  }
}
