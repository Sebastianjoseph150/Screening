import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screenig/repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomerRepo homerRepo;

  HomeBloc(this.homerRepo) : super(HomeInitial()) {
    on<ButtonClicked>(buttonClicked);
  }

  FutureOr<void> buttonClicked(ButtonClicked event, Emitter<HomeState> emit) {
    emit(ButtonClickedState(
        stateSecond: event.currentsecond,
        randomno: event.randomno,
        attempt: event.attempt));
    bool Reulst = homerRepo.check(event.currentsecond, event.randomno);
    if (Reulst == true) {
      emit(SuccessState(
          attempt: event.attempt,
          randomno: event.randomno,
          stateSecond: event.currentsecond));
    } else {
      emit(FailState(
          attempt: event.attempt,
          randomno: event.randomno,
          stateSecond: event.currentsecond));
    }
  }
}
