import 'package:flutter/material.dart';

import '../../../../core/layout/app_scaffold.dart';

class CreateRoadPage extends StatelessWidget {
  const CreateRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Create Road',
      body: Center(
        child: Text('This is the Create Road Page'),
      ),
    );
  }
}