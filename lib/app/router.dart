import 'package:flutter/material.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/start_road/presentation/pages/main_page.dart';
import '../features/create_road/presentation/pages/create_road_page.dart';
import '../features/download_road/presentation/pages/download_page.dart';

class AppRouter {
  static const String home = '/';
  static const String startRoad = '/start-road';
  static const String createRoad = '/create-road';
  static const String downloadRoad = '/download-road';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case startRoad:
        return MaterialPageRoute(builder: (_) => const StartRoadPage());
      case createRoad:
        return MaterialPageRoute(builder: (_) => const CreateRoadPage());
      case downloadRoad:
        return MaterialPageRoute(builder: (_) => const DownloadRoadPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}