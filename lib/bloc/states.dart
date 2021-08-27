import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterState {
  const CounterState();
}

class InitialCounterStates extends CounterState {}

class SuccessCounterStates extends CounterState {}
