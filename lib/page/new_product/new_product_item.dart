import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:macbro_bloc_state/model/new_exam/new_product_list_item.dart';






class NewProductItem extends StatelessWidget {
   NewProductItem({Key? key,required this.allModel}) : super(key: key);
final NewExamProductList allModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: allModel.image.toString(),
                placeholder: (context, url) => Image(

                  image: AssetImage('assets/images/macbro.png'),),
                errorWidget: (context, url, error) => Image(

                  image: AssetImage('assets/images/macbro.png'),),
              ),
            ),
          ),
          Container(
            width: 150,
            margin: EdgeInsets.only(
                left: 10
            ),
            child: Text(allModel.name.toString()),
          ),
          Container(
            // width: 40.w,
            margin: EdgeInsets.only(
                left: 10
            ),
            child: Text("${allModel.cheapestPrice.toString()} sum", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          ),

        ],
      ),
      onTap: (){
        print(allModel.id.toString());
        Navigator.of(context).pushNamed('/screen4',arguments: allModel.id);
      },
    );
  }
}

