import 'package:flutter/material.dart';

import 'navbar.dart';
import 'footer.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: title),
      body: body,
      bottomNavigationBar: Footer(),
    );
  }
}