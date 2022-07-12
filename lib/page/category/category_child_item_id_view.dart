import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:macbro_bloc_state/logic/child_bloc/child_bloc.dart';

import 'package:macbro_bloc_state/model/category_model/category_child_item.dart';
import 'package:macbro_bloc_state/page/category/category_child_item_id.dart';

import 'package:macbro_bloc_state/repository/exam_repo.dart';


class Category_child_itemPage extends StatelessWidget {
  static const String route = '/categorychild';
Dio dio=Dio();
  @override
  Widget build(BuildContext context) {
    final c = ModalRoute
        .of(context)!
        .settings
        .arguments;
    return BlocProvider(
      create: (context) => ChildBloc(RestClient(dio)),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Продукты  ',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 1,
          ),
          body: BlocBuilder<ChildBloc, ChildState>(
            builder: (context, state) {
              if (state is ChildDataInitialState) {
                context.read<ChildBloc>().add(LoadChildDataEvent(c.toString()));
                return const CircularProgressIndicator();
              } else if (state is ChildDataLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChildDataLoadedState) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    buildChildCategory(state.apicategoryChildItem)
                  ],
                );
              } else if (state is ChildDataErrorState) {
                return const Center(
                  child: Text("Uh oh! 😭 Something went wrong!"),
                );
              }

              return const Text("Error");
            },
          )
      ),
    );
  }

  Widget buildChildCategory(CategoryChildItem apiResult) {
    return StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          for(int i = 0; i < apiResult.products!.length; i++)...{
            CategoryChildItemm(allModel: apiResult.products![i],)
          }
        ]
    );
  }
}
