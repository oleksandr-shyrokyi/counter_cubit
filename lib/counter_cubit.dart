import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  // can redefine onChanged to track state change
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}
