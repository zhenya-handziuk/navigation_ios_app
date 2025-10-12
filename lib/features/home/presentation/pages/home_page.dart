import 'package:flutter/material.dart';

import '../../../../app/router.dart';
import '../../../../core/layout/app_scaffold.dart';
// import 'create_road_page.dart';
// import 'download_road_page.dart';
// import 'start_road_page.dart';

// import '../widgets/navigation_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Home',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.startRoad),
              child: const Text('Start Road'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.createRoad),
              child: const Text('Create Road'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRouter.downloadRoad),
              child: const Text('Download Road'),
            ),
          ],
        ),
      ),
    );
  }
}