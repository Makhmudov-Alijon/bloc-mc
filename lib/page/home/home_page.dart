import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:macbro_bloc_state/logic/bloc/game_data_bloc.dart';

import 'package:macbro_bloc_state/model/banner_model/banner_model.dart';
import 'package:macbro_bloc_state/model/banner_model/banners_model.dart';
import 'package:macbro_bloc_state/model/category_model/ExamCategoryModel2.dart';
import 'package:macbro_bloc_state/model/new_exam/new_exam_map.dart';
import 'package:macbro_bloc_state/model/new_exam/new_product_list_item.dart';
import 'package:macbro_bloc_state/page/banners/banner_item.dart';
import 'package:macbro_bloc_state/page/category/categry_item.dart';
import 'package:macbro_bloc_state/page/new_product/new_product_item.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          // context.read<GameDataBloc>().add(GameDataLoading());
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const CircularProgressIndicator();
          } else if (state is GameDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GameDataLoadedState) {
            return ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 20,),
                buildBanner(state.apiBanner),
                SizedBox(height: 20,),
                buildGameModel(state.apiResult),
                SizedBox(height: 20,),
                buildCategory(state.apiCategory)
              ],
            );
          } else if (state is GameDataErrorState) {
            return const Center(
              child: Text("Uh oh! 😭 Something went wrong!"),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }

  Widget buildGameModel(NewExamMap apiResult) {

    return  Container(
      height: 200,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          for(int i=0;i<apiResult.featuredList!.products.length;i++)...{
            NewProductItem(allModel: apiResult.featuredList!.products[i])
          }
        ],
      ),
    );
  }

  Widget buildBanner(BannersModel apiResult) {
    return Container(
      child: CarouselSlider(
        items: [
          for (int i = 0; i < apiResult.banners.length; i++) ...{
            BannerItem(
              allModel: apiResult.banners[i],
            )
          }
        ],
        options: CarouselOptions(
            height: 200,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            viewportFraction: .9,
            // onScrolled: (index) {
            onPageChanged: (index, reason) {}),
      ),
    );
  }
  Widget buildCategory(ExamCategoryModel2 apiResult){
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        for(int i=0;i<apiResult.categories!.length;i++)...{
          CategoryItem(allModel: apiResult.categories![i])
        }
      ],
    );
  }
}
