part of 'bloc/fetch_data_bloc.dart';

abstract class FetchDataEvent extends Equatable {
  const FetchDataEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends FetchDataEvent {}
