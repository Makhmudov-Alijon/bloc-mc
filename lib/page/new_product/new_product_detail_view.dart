import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:macbro_bloc_state/logic/product_details_bloc/product_details_bloc.dart';
import 'package:macbro_bloc_state/model/product_model/product_model.dart';
import 'package:macbro_bloc_state/page/new_product/category_title_item.dart';
import 'package:macbro_bloc_state/page/new_product/new_product_detail_item.dart';
import 'package:macbro_bloc_state/page/new_product/product_detail_image_item.dart';

import 'package:macbro_bloc_state/repository/exam_repo.dart';

class NewProductDetailView extends StatelessWidget {

  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    final c = ModalRoute.of(context)!.settings.arguments;
    return BlocProvider(
      create: (context) => ProductDetailsBloc(RestClient(dio)),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsInitialState) {
              context.read<ProductDetailsBloc>().add(LoadProductDetailsEvent(c.toString()));
              return const CircularProgressIndicator();
            } else if (state is ProductDetailsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsLoadedState) {
              return ListView(
                shrinkWrap: true,
                children: [
                 buildProductDetails(state.apiproductModel)
                ],
              );
            } else if (state is ProductDetailsErrorState) {
              return const Center(
                child: Text("Uh oh! 😭 Something went wrong!"),
              );
            }

            return Center(child: const Text("Error"));
          },
        ),
      ),
    );
  }
  Widget buildProductDetails(ProductModel apiproduct){
    return Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        ImageSlideshow(
          height: 200,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          onPageChanged: (value) {},
          autoPlayInterval: 3000,
          isLoop: true,
          children: apiproduct.product!.variants!.first.value!.gallery!
              .map((e) => ProductImageItem(
            allModel: e,
          ))
              .toList(),
        ),
        for(int i=0;i<apiproduct.product!.properties!.length;i++)...{
          ProdutTitleItem(
              allModel: apiproduct.product!.properties!
                  .elementAt(i)
                  .property!
                  .name
                  .toString()),
          StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children:
            apiproduct.product!.properties![i].value!
                .map((e) => GestureDetector(
                onTap: () {},
                child: ProductItem(
                  allModel: e,

                )))
                .toList(),
          ),
        }
      ],
    );
  }
}
