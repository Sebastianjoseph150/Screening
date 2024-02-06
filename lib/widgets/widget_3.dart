import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenig/bloc/home_screen_bloc/bloc/home_bloc.dart';
import 'package:screenig/bloc/stop_watch_bloc/bloc/stop_watch_bloc.dart';
import 'package:screenig/repository/home_repo.dart';

Widget buildStatusContainer(BuildContext context) {
  HomerRepo repo = HomerRepo();
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is SuccessState) {
        return Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.green, // Set color to green
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Success :)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                'result:${repo.result}/2',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      } else if (state is FailState) {
        if (state.attempt == 0) {
          return Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.orange, // Set color to orange
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time is Over!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text(
                  'Attempts: 0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sorry try Again!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text(
                  'Attempts: ${state.attempt}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }
      }

      return const SizedBox();
    },
  );
}
