import 'package:counter_cubit/counter_cubit.dart';
import 'package:counter_cubit/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // BlocProvider provides CounterCubit to CounterPage (children)
      // vid BlocProvider.of<T>(context). It is used as a dependency injection (DI)
      // widget so that a single instance of a bloc can be provided to multiple widgets within a subtree.
      // By default, BlocProvider will create the bloc lazily, meaning create will get executed when
      // the bloc is looked up via BlocProvider.of<BlocA>(context).
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterScreen(),
      ),
    );
  }
}
