part of 'bloc/fetch_data_bloc.dart';

abstract class FetchDataState extends Equatable {
  const FetchDataState();

  @override
  List<Object> get props => [];
}

class FetchDataInitial extends FetchDataState {}

class ProductLoading extends FetchDataState {}

class ProductsLoaded extends FetchDataState {
  final List<Product> productsList;
  ProductsLoaded(this.productsList);
}
