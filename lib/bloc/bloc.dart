import 'dart:math';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flitill/models/favWidget.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
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
  CounterState get initialState => InitialCounterStates();
  static CounterBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  Stream<CounterState> mapEventToState(CounterEvents event) async* {
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

  Stream<CounterState> _changeVale() async* {
    counter = Random().nextInt(50);
    yield SuccessCounterStates();
  }

  Stream<CounterState> _changeDetailsVale() async* {
    isDetails = !isDetails;
    yield SuccessCounterStates();
  }

  Stream<CounterState> _changeProductDetails(newProduct) async* {
    productDetails = newProduct;
    yield SuccessCounterStates();
  }

  Stream<CounterState> _changeFavProducts(newProduct) async* {
    favProducts.add(FavrouitWidget(
      title: newProduct['title'],
      price: newProduct['price'],
      imgPath: newProduct['image'],
      index: favProducts.length,
    ));
    var myDouble = double.parse(newProduct['price']);
    assert(myDouble is double);
    totalPrice += myDouble;

    yield SuccessCounterStates();
  }

  Stream<CounterState> _deleteProduct(product) async* {
    favProducts.remove(product);
    yield SuccessCounterStates();
  }

  Stream<CounterState> _minusPrice(p) async* {
    var myDouble = double.parse(p);
    assert(myDouble is double);
    totalPrice -= myDouble;
    yield SuccessCounterStates();
  }
}
