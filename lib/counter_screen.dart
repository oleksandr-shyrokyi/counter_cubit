import 'package:counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Successfully separated presentation layer from business logic
// layer.
class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      // BlocBuilder handles building the widget in response to new states.
      // Similar to StreamBuilder but has simpler API to avoid boilerplate
      // Should be pure function returning a widget in response to the state.
      // If you want do anything in response to state changes: navigation, dialog - use BlocListener
      body: BlocBuilder<CounterCubit, int>(
        // bloc: <= if this is omitted BlockBuilder looks up using BlocProvider and BuildContext
        // specify bloc: only if it will be scoped to a single widget and isn't accessible  via parent
        // BlocProvider and current BuildContext
        // buildWhen: <= prevState == currState ? true (rebuild) : false (do nothing)
        builder: (context, count) => Center(
          // returns widget here based on CounterCubit's state - int
          child: Text(
            '$count',
            style: const TextStyle(fontSize: 72),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // CounterScreen knows nothing about what happens on button pressed
            // It simply notifies CounterCubit, that user pressed the button
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
