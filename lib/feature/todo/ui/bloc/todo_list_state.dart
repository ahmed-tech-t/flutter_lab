part of 'todo_list_bloc.dart';

sealed class TodoListState extends Equatable {
  const TodoListState();
  
  @override
  List<Object> get props => [];
}

final class Initial extends TodoListState {}
final class Loading extends TodoListState {}
final class Success extends TodoListState {
  final List<Todo> items;
  final TodoFilter filter;

  const Success(this.items, this.filter);

  @override
  List<Object> get props => [items, filter];
}
final class Error extends TodoListState {
  final String message;
  const Error(this.message);
    @override
  List<Object> get props => [message];
}

final class OverLayLoading extends TodoListState {}

