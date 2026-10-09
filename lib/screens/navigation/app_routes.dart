import 'package:flutter_application_1/feature/todo/data/repositories/todo_repository_impl.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/add_task_screen.dart';
import 'package:flutter_application_1/feature/todo/ui/add_task/bloc/add_task_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/edit_task/bloc/edit_task_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/edit_task/edit_task_screen.dart';
import 'package:flutter_application_1/feature/todo/ui/list/bloc/todo_list_bloc.dart';
import 'package:flutter_application_1/feature/todo/ui/todo_details/bloc/todo_details_cubit.dart';
import 'package:flutter_application_1/feature/todo/ui/todo_details/todo_details_screen.dart';
import 'package:flutter_application_1/feature/todo/ui/list/todo_list_screen.dart';
import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/counter_screen.dart';
import 'package:flutter_application_1/feature/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
    GetPage(
      name: NEW_TASK,
      page: () => BlocProvider(
        create: (context) => AddTaskCubit(TodoRepositoryImpl()),
        child: const AddTaskScreen(),
      ),
    ),
    GetPage(
      name: '/todo_details/:id',
      page: () => BlocProvider(
        create: (context) => TodoDetailsCubit(
          todo: Get.arguments as Todo,
          repository: TodoRepositoryImpl(),
        ),
        child: const TodoDetailsScreen(),
      ),
    ),
    GetPage(
      name: '/todo_edit/:id',
      page: () => BlocProvider(
        create: (context) => EditTaskCubit(
          initialTodo: Get.arguments as Todo,
          repository: TodoRepositoryImpl(),
        ),
        child: const EditTaskScreen(),
      ),
    ),
  ];
}
