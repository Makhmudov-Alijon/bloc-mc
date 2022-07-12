part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  @override
  List<Object> get props => [];
}


class ProductDetailsInitialState extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsLoadedState extends ProductDetailsState {
  final ProductModel apiproductModel;
  const ProductDetailsLoadedState( {
   required this.apiproductModel,
  });
}

class ProductDetailsErrorState extends ProductDetailsState {}