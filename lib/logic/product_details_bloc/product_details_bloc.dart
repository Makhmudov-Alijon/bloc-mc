import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:macbro_bloc_state/model/product_model/product_model.dart';
import 'package:macbro_bloc_state/repository/exam_repo.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final RestClient restClient;
  ProductDetailsBloc(this.restClient) : super(ProductDetailsInitialState()) {
    on<ProductDetailsEvent>((event, emit) async{
      if (event is LoadProductDetailsEvent) {
        emit(ProductDetailsLoadingState());
        ProductModel apiproductModel=await restClient.getProductId(event.id!);
        if (apiproductModel==null) {
          emit(ProductDetailsErrorState());
        } else {
          emit(ProductDetailsLoadedState(apiproductModel: apiproductModel));
          if (state is ProductDetailsLoadedState) {
            event.id!=null;
          }
          print('data keldi');
        }

      }
    });
  }
}
