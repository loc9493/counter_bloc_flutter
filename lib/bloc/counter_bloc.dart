import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => InitialCounterState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is Increase) {
      int counter = currentState.counter + 1;
      yield InitialCounterState(counter);
    }
    if (event is Decrease) {
      yield InitialCounterState(currentState.counter - 1);
    }
  }
}
