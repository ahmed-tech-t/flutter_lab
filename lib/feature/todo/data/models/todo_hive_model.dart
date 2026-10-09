import 'package:hive/hive.dart';

part 'todo_hive_model.g.dart';

@HiveType(typeId: 0)
class TodoHiveModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final String statusName;

  @HiveField(4)
  final int? dateMillis;

  TodoHiveModel({
    required this.id,
    required this.title,
    required this.body,
    required this.statusName,
    this.dateMillis,
  });
}
