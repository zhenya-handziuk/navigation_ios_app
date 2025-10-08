import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_scaffold.dart';

class DownloadRoadPage extends StatelessWidget {
  const DownloadRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Download Road',
      body: Center(
        child: Text('This is the Download Road Page'),
      ),
    );
  }
}