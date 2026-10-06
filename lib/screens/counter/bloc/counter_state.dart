part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter=0});
  
  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

final class CounterValueChanged extends CounterState {
  const CounterValueChanged({required super.counter});
}
