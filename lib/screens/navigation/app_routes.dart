// ignore_for_file: constant_identifier_names

import 'package:flutter_application_1/screens/counter/bloc/counter_bloc.dart';
import 'package:flutter_application_1/screens/counter/counter_screen.dart';
import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const HOME = '/home';
  static const COUNTER = '/counter';
  static const TODO ="/todo";

  static final routes = [
    GetPage(name: HOME, page: () => HomeScreen()),
    GetPage(name: COUNTER, page: () =>BlocProvider(create: (context) =>CounterBloc(),child: CounterScreen())),
  ];
}