import 'dart:math';
import 'package:flitill/presentation/screens/widgets/favWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'states.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  int counter = 0;
  bool isDetails = false;
  double totalPrice = 00.0;
  String userName = 'empty';
  var productDetails = {
    'title': 'title',
    'price': '00.00',
    'description': 'description',
    'image': '',
  };
  List<FavrouitWidget> favProducts = [];
  @override
  //implement initialState
  ProductState get initialState => InitialProductStates();
  static ProductBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  Stream<ProductState> mapEventToState(ProductEvents event) async* {
    if (event is WeatherDegree) {
      yield* _changeVale();
    }
    if (event is ChangeDetailsBoolen) {
      yield* _changeDetailsVale();
    }
    if (event is ChangeProductDetails) {
      yield* _changeProductDetails(event.product);
    }
    if (event is AddToFavourites) {
      yield* _changeFavProducts(event.pro);
    }
    if (event is DeleteFavourites) {
      yield* _deleteProduct(event.product);
    }
    if (event is MinusTotalPrice) {
      yield* _minusPrice(event.price);
    }
  }

  Stream<ProductState> _changeVale() async* {
    counter = Random().nextInt(50);
    yield SuccessProductStates();
  }

  Stream<ProductState> _changeDetailsVale() async* {
    isDetails = !isDetails;
    yield SuccessProductStates();
  }

  Stream<ProductState> _changeProductDetails(newProduct) async* {
    productDetails = newProduct;
    yield SuccessProductStates();
  }

  Stream<ProductState> _changeFavProducts(newProduct) async* {
    favProducts.add(FavrouitWidget(
      title: newProduct['title'],
      price: newProduct['price'],
      imgPath: newProduct['image'],
      index: favProducts.length,
    ));
    var myDouble = double.parse(newProduct['price']);
    assert(myDouble is double);
    totalPrice += myDouble;

    yield SuccessProductStates();
  }

  Stream<ProductState> _deleteProduct(product) async* {
    favProducts.remove(product);
    yield SuccessProductStates();
  }

  Stream<ProductState> _minusPrice(p) async* {
    var myDouble = double.parse(p);
    assert(myDouble is double);
    totalPrice -= myDouble;
    yield SuccessProductStates();
  }
}
