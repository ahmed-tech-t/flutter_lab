import 'package:flutter/material.dart';

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
