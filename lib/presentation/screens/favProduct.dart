import 'package:flitill/bussiness_logic/bloc/bloc.dart';
import 'package:flitill/bussiness_logic/bloc/states.dart';
import 'package:flitill/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavProducts extends StatelessWidget {
  const FavProducts({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shopping cart'),
        shadowColor: kSubColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (BuildContext context, ProductState state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Total cost: ${ProductBloc.get(context).totalPrice.abs().toStringAsFixed(2)} \$   ',
                          style: addToBasket,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: ProductBloc.get(context).favProducts,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
