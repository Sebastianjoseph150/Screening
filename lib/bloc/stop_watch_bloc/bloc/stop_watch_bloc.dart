import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stop_watch_event.dart';
part 'stop_watch_state.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchState> {
  late Timer _timer;
  int _countdown = 5; 

  StopwatchBloc() : super(StopwatchInitial(countdown: 5, progress: 1)) {
    on<StartStopwatch>(_mapStartToState);
    on<PauseStopwatch>(_mapPauseToState);
    on<ResetStopwatch>(_mapResetToState);
  }

  Future<void> _mapStartToState(
      StartStopwatch event, Emitter<StopwatchState> emit) async {
    _countdown = event.initialCountdown;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown--;
        emit(StopwatchRunning(
          countdown: _countdown,
          progress: _countdown / event.initialCountdown,
        ));
      } else {
        _timer.cancel();
        emit(StopwatchStop());
      }
    });
    await Future.delayed(Duration(seconds: event.initialCountdown));
  }

  void _mapPauseToState(PauseStopwatch event, Emitter<StopwatchState> emit) {
    _timer.cancel();
  }

  void _mapResetToState(ResetStopwatch event, Emitter<StopwatchState> emit) {
    _countdown = 10;
    _timer.cancel();
    emit(StopwatchInitial(countdown: 10, progress: 1));
  }
}
