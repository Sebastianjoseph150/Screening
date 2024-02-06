part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ContainerState extends HomeState {
  final Color color;
  final String content;

  ContainerState({required this.color, required this.content});
}

class ButtonClickedState extends HomeState {
  final int stateSecond;
  final int randomno;
  final int attempt;

  ButtonClickedState(
      {required this.stateSecond,
      required this.randomno,
      required this.attempt});
}

class SuccessState extends HomeState {
  final int attempt;
   final int stateSecond;
  final int randomno;
  SuccessState({required this.attempt,required this.randomno,required this.stateSecond});
}

class FailState extends HomeState {
  final int attempt;
 final int stateSecond;
  final int randomno;
  FailState({required this.attempt,required this.randomno,required this.stateSecond});
}
