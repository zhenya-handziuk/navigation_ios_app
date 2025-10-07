import 'package:flutter/material.dart';
import '../../../../core/widgets/app_button.dart';

class NavigationButton extends StatelessWidget {
  final String text;
  final Widget page;

  const NavigationButton({
    super.key,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}