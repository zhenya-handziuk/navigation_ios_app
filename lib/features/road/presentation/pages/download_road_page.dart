import 'package:flutter/material.dart';

class DownloadRoadPage extends StatelessWidget{
  const DownloadRoadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Download Road')),
      body: Center(
        child: Text('This is the Download Road Page'),
      ),
    );
  }
}