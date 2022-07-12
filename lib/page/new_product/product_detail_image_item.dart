


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class ProductImageItem extends StatelessWidget {
   ProductImageItem({Key? key,required this.allModel,}) : super(key: key);
  final String allModel;


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: allModel,
      width: 100,
      height: 100,
      fit: BoxFit.fitHeight,
      placeholder: (context, url) => Image(

        image: AssetImage('assets/images/macbro.png'),),
      errorWidget: (context, url, error) => Image(

        image: AssetImage('assets/images/macbro.png'),),
    );
  }
}
