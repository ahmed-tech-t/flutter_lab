import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppMaterial.dart';
import 'package:flutter_application_1/core/database/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMaterial();
  }
}
