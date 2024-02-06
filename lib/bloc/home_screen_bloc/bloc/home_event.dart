part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class containerCheckEvent extends HomeEvent {
  final int num1;
  final int num2;

  containerCheckEvent({required this.num1, required this.num2});
}

class ButtonClicked extends HomeEvent {
  final int currentsecond;
  final int randomno;
  final int attempt;

  ButtonClicked(
      {required this.currentsecond,
      required this.randomno,
      required this.attempt});
}
