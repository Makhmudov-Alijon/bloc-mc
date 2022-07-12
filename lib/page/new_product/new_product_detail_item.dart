
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:macbro_bloc_state/model/product_model/product_model.dart';


class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.allModel,}) : super(key: key);
  final Value1 allModel;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(
          width: 55,
          height: 70,

          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colors.white ,
              boxShadow:  [
                BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 1
                )
              ]
          ),
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorRead(allModel.value.toString().toLowerCase()),
                ),


              ),
              Center(
                child: Text(allModel.name.toString(),),
              ),
            ],
          )
      ),
      onTap: (){

      }
    );
  }
  ColorRead(String color){
    switch (color) {
      case 'red': {
        return Colors.red;
      }
      case 'black':{
        return Colors.black;
      }
      case 'pink': {
        return Colors.pink;
      }
      case 'blue':{
        return HexColor('#3a88fe');
      }
      case 'green':{
        return Colors.green;
      }
      case 'white':{
        return Colors.grey[300];
      }
      case 'gold':{
        return HexColor('#ffd877');
      }
      case 'silver':{
      return HexColor('#DDE6E8');
      }
      case 'graphite':{
        return HexColor('#606060');
      }
      case 'light blue':{
        return HexColor('#6fb7e7');
      }
      case 'grey':{
        return Colors.grey;
      }
      case 'purple':{
        return HexColor('#8E43AD');
      }
    }

  }
   onSelected(bool selected) {
    if(selected){
      selected=false;
    }else{
      selected=true;
    }

   }
}
