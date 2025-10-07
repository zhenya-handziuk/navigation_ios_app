import 'package:flutter/material.dart';

class StartRoadPage extends StatelessWidget {
  const StartRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('StartRoadPage built');
    return Scaffold(
      appBar: AppBar(title: Text('Start Road')),
      body: Center(
        child: Text('This is the Start Road Page'),
      ),
    );
  }
}