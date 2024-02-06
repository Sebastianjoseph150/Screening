part of 'stop_watch_bloc.dart';

@immutable


abstract class StopwatchState {}

class StopwatchInitial extends StopwatchState {
  final int countdown;

  final int progress;

  StopwatchInitial({required this.countdown, required this.progress});
}

class StopwatchRunning extends StopwatchState {
  final int countdown;
  final double progress;

  StopwatchRunning({required this.countdown, required this.progress});
}

class StopwatchStop extends StopwatchState {}

class StopwatchPaused extends StopwatchState {}
