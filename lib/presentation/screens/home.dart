import 'package:flitill/bussiness_logic/bloc/bloc.dart';
import 'package:flitill/bussiness_logic/bloc/states.dart';
import 'package:flitill/bussiness_logic/fetch_data_bloc/bloc/fetch_data_bloc.dart';
import 'package:flitill/presentation/widgets/details.dart';
import 'package:flitill/presentation/widgets/scaled_list.dart';
import 'package:flitill/presentation/widgets/shopping_cart.dart';
import 'package:flitill/presentation/widgets/showDetailsDiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favProduct.dart';

class MyHomePage extends StatefulWidget {
  static const id = 'home_page';
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FetchDataBloc.get(context).add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Michael Shop'),
        actions: [
          ShoppingCart(
            fun: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FavProducts()));
              //
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: BlocBuilder<FetchDataBloc, FetchDataState>(
              //bloc: _counterBloc,
              builder: (BuildContext context, FetchDataState state) {
                if (state is ProductsLoaded) {
                  var list = state.productsList;
                  //data is loaded and ready to appears
                  return BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          ScaleListWidget(prodData: list),
                          ShowDetailsDiver(),
                          //get the boolen from bloc
                          ProductBloc.get(context).isDetails
                              ? Details()
                              : Container()
                        ],
                      );
                    },
                  );
                } else if (state is ProductLoading) {
                  //data is still in loading
                  return Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  //loading error
                  return Text('-------Error-------');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
