import 'dart:convert';
import 'package:flitill/models/showDetailsDiver.dart';
import 'package:flutter/scheduler.dart';
import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/models/details.dart';
import 'package:flitill/models/scaled_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flitill/constants.dart';

class Products extends StatefulWidget {
  final urlChild;
  const Products({Key key, @required this.urlChild}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    if (CounterBloc.get(context).isDetails == true)
      CounterBloc.get(context).add(ChangeDetailsBoolen());
    super.initState();
  }

  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _counterBloc,
        builder: (BuildContext context, CounterState state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: FutureBuilder(
                      future: http.get("$url${widget.urlChild}"),
                      builder: (context, snapshot) {
                        var response;
                        if (snapshot.hasData) response = snapshot.data;
                        if (response != null &&
                            (response.statusCode == 200 ||
                                response.statusCode == 202)) {
                          final productData = json.decode(response.body);
                          return Column(
                            children: [
                              ProductsWidget(data: productData),
                              ShowDetailsDiver(),
                              //get the boolen from bloc
                              CounterBloc.get(context).isDetails
                                  ? Details()
                                  : Container()
                            ],
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }),
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}

class ProductsWidget extends StatelessWidget {
  final data;
  const ProductsWidget({Key key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [ScaleListWidget(prodData: data)],
        ),
      ),
    );
  }
}
