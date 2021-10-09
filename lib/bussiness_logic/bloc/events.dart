import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductEvents {
  const ProductEvents();
}

class WeatherDegree extends ProductEvents {}

class ChangeName extends ProductEvents {}

class ChangeDetailsBoolen extends ProductEvents {}

class ChangeProductDetails extends ProductEvents {
  final product;
  ChangeProductDetails({@required this.product});
}

class AddToFavourites extends ProductEvents {
  final pro;
  AddToFavourites({@required this.pro});
}

class DeleteFavourites extends ProductEvents {
  final product;
  DeleteFavourites({@required this.product});
}

class MinusTotalPrice extends ProductEvents {
  final price;
  MinusTotalPrice({@required this.price});
}
