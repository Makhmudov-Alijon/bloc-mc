import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:macbro_bloc_state/logic/bloc/game_data_bloc.dart';

import 'package:macbro_bloc_state/page/category/category_child_item_id_view.dart';
import 'package:macbro_bloc_state/page/category/category_detail.dart';
import 'package:macbro_bloc_state/page/home/home_page.dart';
import 'package:macbro_bloc_state/page/new_product/new_product_detail_view.dart';

import 'package:macbro_bloc_state/repository/exam_repo.dart';
import 'package:responsive_framework/responsive_wrapper.dart';



void main() {
  Dio dio = Dio();
  runApp( BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(RestClient(dio)),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      routes: <String, WidgetBuilder> {
        '/screen2': (BuildContext context) => new SubCategoryItem(),
        '/screen1' : (BuildContext context) => new HomePage(),
        '/screen3' : (BuildContext context) => new Category_child_itemPage(),
        '/screen4' : (BuildContext context) => new NewProductDetailView(),
      },
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 2000,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(400, name: MOBILE),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
    );
  }

}


