import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenig/bloc/home_screen_bloc/bloc/home_bloc.dart';

Widget buildNumberContainer(BuildContext context) {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      if (state is SuccessState) {
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 174, 208, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                '${state.randomno}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      } else if (state is FailState) {
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 174, 208, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Random number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                '${state.randomno}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 174, 208, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
