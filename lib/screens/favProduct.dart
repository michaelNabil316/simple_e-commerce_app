import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavProducts extends StatefulWidget {
  const FavProducts({Key key}) : super(key: key);

  @override
  _FavProductsState createState() => _FavProductsState();
}

class _FavProductsState extends State<FavProducts> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My shopping cart'),
            shadowColor: kSubColor,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Total cost: ${CounterBloc.get(context).totalPrice.abs().toStringAsFixed(2)} \$   ',
                          style: addToBasket,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: CounterBloc.get(context).favProducts,
                  ),
                ],
              )),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}
