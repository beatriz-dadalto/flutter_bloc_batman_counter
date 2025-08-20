import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_made_simple/bloc/counter_event.dart';
import 'package:flutter_bloc_made_simple/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
    on<CounterResetPressed>((event, emit) {
      emit(CounterState(count: 0));
    });
  }
}
