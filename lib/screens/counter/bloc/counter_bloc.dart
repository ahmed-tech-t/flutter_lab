import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      switch (event.runtimeType) {
        case CounterIncremented:
          emit(CounterValueChanged(counter: state.counter + 1));
          break;
        case CounterDecremented:
          emit(CounterValueChanged(counter: state.counter - 1));
          break;
        case CounterReset:
          emit(const CounterInitial());
          break;
      }
    });
  }
}
