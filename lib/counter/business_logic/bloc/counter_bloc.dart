import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      emit(
        CounterState(counter: state.counter + 1),
      );
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(
        CounterState(counter: state.counter - 1),
      );
    });
  }
}
