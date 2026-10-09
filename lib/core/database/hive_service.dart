import 'package:flutter_application_1/feature/todo/data/models/todo_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Centralized box name constants to avoid typos
abstract final class HiveBoxes {
  static const String todos = 'todos_box';
}

/// Production-grade Hive initialization and management service
abstract final class HiveService {
  /// Initialize Hive, register all adapters, and pre-open necessary boxes
  static Future<void> init() async {
    // 1. Initialize Hive with the Flutter application document directory
    await Hive.initFlutter();

    // 2. Register Type Adapters safely
    _registerAdapters();

    // 3. Pre-open boxes at startup for instant synchronous access
    await Hive.openBox<TodoHiveModel>(HiveBoxes.todos);
  }

  /// Safe registration to avoid duplicate registration crashes during Hot Restart
  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TodoHiveModelAdapter());
    }
  }

  /// Typed getter for the Todo box
  static Box<TodoHiveModel> get todosBox =>
      Hive.box<TodoHiveModel>(HiveBoxes.todos);

  /// Helper to close all boxes on app logout/disposal if needed
  static Future<void> closeAll() async {
    await Hive.close();
  }
}
