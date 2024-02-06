import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenig/bloc/home_screen_bloc/bloc/home_bloc.dart';
import 'package:screenig/bloc/stop_watch_bloc/bloc/stop_watch_bloc.dart';
import 'package:screenig/widgets/circular_watch.dart';

class CircularStopwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
      builder: (context, state) {
        print(state);
        if (state is StopwatchInitial) {
          return CustomPaint(
            size: const Size(150, 150),
            painter: StopwatchPainter(
              progress: state.progress.toDouble(),
              countdown: state.countdown,
            ),
          );
        } else if (state is StopwatchRunning) {
          return CustomPaint(
            size: const Size(150, 150),
            painter: StopwatchPainter(
              progress: state.progress.toDouble(),
              countdown: state.countdown,
            ),
          );
        } else if (state is StopwatchStop) {
          return const SizedBox(
            width: 200,
            height: 100,
            child: Center(
              child: Text(
                'Your time is over',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          );
        } else if (state is StopwatchStop) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
