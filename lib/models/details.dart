import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    final productDetails = CounterBloc.get(context).productDetails;
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  productDetails['title'],
                  textAlign: TextAlign.center,
                  style: detailsTitle,
                ),
              ),
              Text(
                '${productDetails['price']} \$',
                style: detailsPrice,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  productDetails['description'],
                  textAlign: TextAlign.center,
                  style: detailsDescription,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: kSubColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to basket ', style: addToBasket),
                        SizedBox(width: 20),
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  var newProductDetails = {
                    'title': '${productDetails['title']}',
                    'price': productDetails['price'],
                    'description': '${productDetails['description']}',
                    'image': '${productDetails['image']}'
                  };
                  CounterBloc.get(context)
                      .add(AddToFavourites(pro: newProductDetails));
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Done',
                    desc: 'put in cart',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
              SizedBox(height: 70)
            ],
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
