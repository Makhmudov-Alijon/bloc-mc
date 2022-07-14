part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  final String? id;
  const ProductDetailsEvent(this.id);
  @override
  List<Object> get props => [];
}
class LoadProductDetailsEvent extends ProductDetailsEvent {
  LoadProductDetailsEvent( super.id);
}