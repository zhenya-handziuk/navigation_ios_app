import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/app.dart';
// import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initDependencies();

  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }

  runApp(const MyApp());
}
