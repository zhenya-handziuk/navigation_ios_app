import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '© 2024 My Company',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}