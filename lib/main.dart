import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenig/bloc/home_screen_bloc/bloc/home_bloc.dart';
import 'package:screenig/bloc/stop_watch_bloc/bloc/stop_watch_bloc.dart';
import 'package:screenig/repository/home_repo.dart';
import 'package:screenig/screens/home_screen.dart';
import 'package:screenig/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<StopwatchBloc>(
            create: (context) => StopwatchBloc(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(HomerRepo()),
          ),
        ],
        child: Homscreen(),
      ),
    );
  }
}
