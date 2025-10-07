import 'package:flutter/material.dart';

import 'create_road_page.dart';
import 'download_road_page.dart';
import 'start_road_page.dart';

import '../widgets/navigation_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigationButton(text: 'Start Road', page: const StartRoadPage()),
            const SizedBox(height: 16),
            NavigationButton(text: 'Create Road', page: const CreateRoadPage()),
            const SizedBox(height: 16),
            NavigationButton(text: 'Download Road', page: const DownloadRoadPage()),
          ],
        ),
      ),
    );
  }
}