import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit {

  CounterCubit() : super(1);

  void incrementBy(int value) => emit(state + value);
}