import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

class InitialProductStates extends ProductState {}

class SuccessProductStates extends ProductState {}
