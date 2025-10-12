import 'package:flutter/material.dart';
import '../../../../core/layout/app_scaffold.dart';
import '../bloc/start_road_bloc.dart';

class RoadPage extends StatelessWidget {
  final StartRoadLoaded state;

  const RoadPage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    print(context);
    return AppScaffold(
      title: 'Road',
      body: Center(
        child: Text('Navigating to Road Page ${state.trailId}'),
      ),
    );
  }
}