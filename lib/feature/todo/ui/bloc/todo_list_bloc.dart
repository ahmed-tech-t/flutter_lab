import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo.dart';
import 'package:flutter_application_1/feature/todo/domain/models/todo_filter.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Cubit< TodoListState> {
  TodoListBloc() : super(Initial()) {
  
  }
}
