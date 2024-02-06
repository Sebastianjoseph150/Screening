import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenig/bloc/home_screen_bloc/bloc/home_bloc.dart';
import 'package:screenig/bloc/stop_watch_bloc/bloc/stop_watch_bloc.dart';
import 'package:screenig/widgets/stop_watch.dart';
import 'package:screenig/widgets/widget_1.dart';
import 'package:screenig/widgets/widget_2.dart';
import 'package:screenig/widgets/widget_3.dart';


class Homscreen extends StatelessWidget {
  int currentSecond = 0;
  int clickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        centerTitle: true,
      ),
      body: BlocBuilder<StopwatchBloc, StopwatchState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildNumberContainer(context),
                  const SizedBox(width: 20),
                  buildSecondContainer(context),
                ],
              ),
              const SizedBox(height: 20),
              buildStatusContainer(context),
              CircularStopwatch(),
              ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide.none), //
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.blue,
                  ),
                ),
                onPressed: () {
                  context.read<StopwatchBloc>().add(StartStopwatch(
                        initialCountdown: 10,
                        initialProgress: 1.0,
                      ));
                  currentSecond = DateTime.now().second;
                  clickCount++;
                  context.read<HomeBloc>().add(ButtonClicked(
                        currentsecond: currentSecond,
                        randomno: Random().nextInt(60) + 1,
                        attempt: clickCount,
                      ));
                },
                child: const Text(
                  'Click',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
