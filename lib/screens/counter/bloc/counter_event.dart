part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}


final class CounterIncremented extends CounterEvent {}
final class CounterDecremented extends CounterEvent {}
final class CounterReset extends CounterEvent {}