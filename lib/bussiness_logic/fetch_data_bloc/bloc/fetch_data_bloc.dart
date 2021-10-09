import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flitill/Data/models/product_model.dart';
import 'package:flitill/Data/repository/products_repository.dart';
import 'package:flitill/Data/web_services/web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../fetch_data_event.dart';
part '../fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  List<Product> allProducts;
  ProductRepository productRepository = ProductRepository(ProductWebServices());

  FetchDataState get initialState => FetchDataInitial();
  static FetchDataBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  Stream<FetchDataState> mapEventToState(FetchDataEvent event) async* {
    if (event is FetchProductsEvent) {
      yield* _fetchProductsData();
    }
  }

  //fetch data from repository
  Stream<FetchDataState> _fetchProductsData() async* {
    yield ProductLoading();
    await productRepository.getAllProducts().then((value) {
      this.allProducts = value;
    });
    yield ProductsLoaded(allProducts);
  }
}
