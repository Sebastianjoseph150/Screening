part of 'stop_watch_bloc.dart';

@immutable
abstract class StopwatchEvent {}

class StartStopwatch extends StopwatchEvent {
  final int initialCountdown;
  final double initialProgress;

  StartStopwatch({
    required this.initialCountdown,
    required this.initialProgress,
  });
}

class PauseStopwatch extends StopwatchEvent {}

class ResetStopwatch extends StopwatchEvent {}

class StopwatchTick extends StopwatchEvent {
  final int countdown;

  StopwatchTick(this.countdown);
}
