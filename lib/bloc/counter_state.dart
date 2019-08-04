import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterState extends Equatable {
  int counter = 0;
  CounterState(this.counter, [List props = const []]) : super([counter]..addAll(props));
}

class InitialCounterState extends CounterState {
  InitialCounterState(int counter) : super(counter);
  
}
