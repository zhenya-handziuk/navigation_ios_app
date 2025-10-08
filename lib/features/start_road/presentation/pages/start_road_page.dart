import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_scaffold.dart';

class StartRoadPage extends StatelessWidget {
  const StartRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Start Road',
      body: Center(
        child: Text('This is the Start Road Page'),
      ),
    );
  }
}