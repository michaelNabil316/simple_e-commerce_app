import 'package:flitill/bussiness_logic/bloc/bloc.dart';
import 'package:flitill/bussiness_logic/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatelessWidget {
  final fun;
  const ShoppingCart({Key key, this.fun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: fun,
        ),
        Positioned(
          right: 8,
          top: 6,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.amber,
            ),
            child: Center(child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return Text(' ${ProductBloc.get(context).favProducts.length} ');
              },
            )),
          ),
        )
      ],
    );
  }
}
