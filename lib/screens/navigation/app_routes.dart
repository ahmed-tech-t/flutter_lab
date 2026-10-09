// ignore_for_file: constant_identifier_names

import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/ui/bloc/todo_list_bloc.dart';
import 'package:flutter_application_1/feature/todo/ui/todo_list_screen.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/counter_screen.dart';
import 'package:flutter_application_1/feature/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const HOME = '/home';
  static const COUNTER = '/counter';
  static const TODO = "/todo";
  static const NEW_TASK = "/new_task";
  static String todoDetails(String id) => "/todo_details/$id";
  static String todoEdit(String id) => "/todo_edit/$id";

  static final routes = [
    GetPage(name: HOME, page: () => HomeScreen()),
    GetPage(
      name: COUNTER,
      page: () => BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterScreen(),
      ),
    ),
    GetPage(
      name: TODO,
      page: () => BlocProvider(
        create: (context) => TodoListBloc(TodoRepositoryImpl()),
        child: const TodoListScreen(),
      ),
    ),
  ];
}
