import 'package:flutter/material.dart';

class CountdownSwitcher extends StatelessWidget {
  final int countdown;

  const CountdownSwitcher({
    super.key,
    required this.countdown,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
      child: Text(
        '$countdown',
        style: const TextStyle(
          fontSize: 100,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}