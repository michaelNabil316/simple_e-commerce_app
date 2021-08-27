import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterEvents {
  const CounterEvents();
}

class WeatherDegree extends CounterEvents {}

class ChangeName extends CounterEvents {}

class ChangeDetailsBoolen extends CounterEvents {}

class ChangeProductDetails extends CounterEvents {
  final product;
  ChangeProductDetails({@required this.product});
}

class AddToFavourites extends CounterEvents {
  final pro;
  AddToFavourites({@required this.pro});
}

class DeleteFavourites extends CounterEvents {
  final product;
  DeleteFavourites({@required this.product});
}

class MinusTotalPrice extends CounterEvents {
  final price;
  MinusTotalPrice({@required this.price});
}
