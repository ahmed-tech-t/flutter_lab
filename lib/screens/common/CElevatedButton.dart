import 'package:flutter/material.dart';

class CElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final Size size;
  const CElevatedButton({
    super.key,
     this.size = const Size(30, 30),
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
        fixedSize: size
      ),
      child: Icon(icon),
    );
  }
}
