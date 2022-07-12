import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:macbro_bloc_state/model/category_model/ExamCategoryModel2.dart';
import 'package:macbro_bloc_state/page/argument.dart';
import 'package:macbro_bloc_state/page/category/category_child_item.dart';






class SubCategoryItem extends StatelessWidget {
  SubCategoryItem({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c=ModalRoute.of(context)!.settings.arguments as Argumenttt;
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты${c.name}  ',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 1,
      ),
      body:ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          StaggeredGrid.count(

            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children:[
              for(int i=0;i<c.children.length;i++)...{
                CategoryChild(allModel: c.children[i])
              }
            ],
          ),
        ],
      ),
    );
  }
}
