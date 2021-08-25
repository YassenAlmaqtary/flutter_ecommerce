import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/constants.dart';
import 'package:mystore/model/product.dart';
import 'package:get/get.dart';
import 'package:mystore/controller/ainmation/anmation_photo.dart';

class  ProductImages extends StatelessWidget {
  final Product product;

   ProductImages({Key key, @required this.product}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {

    return GetBuilder<AnmationPhoto>(
      init:AnmationPhoto(),
      builder:(controller)=> Column(
        children: [
          SizedBox(
            width:getProportionateScreenWidth(context:context,inputWidth:238),
            child: AspectRatio(
              aspectRatio:1,
              child:Hero(
                tag:product.title.toString(),
                child: Image.network(url_image+product.images[controller.selectedImage]),

              ),

            ),
          ),


          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
             ...List.generate(product.images.length, (index){
               return buildSmallProductPreview(index:index,context:context);
             })
            ],
          )
        ],
      ),
    );
  }

    Widget buildSmallProductPreview({int index,BuildContext context}){
    return GetBuilder<AnmationPhoto> (
      builder:(controller)=> GestureDetector(
        onTap:(){
          controller.selectImages(index);
        },
        child:AnimatedContainer(
          margin:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:15),),
          width:getProportionateScreenWidth(context:context,inputWidth:48),
          height:getProportionateScreenWidth(context:context,inputWidth:48),
          padding:EdgeInsets.all(getProportionateScreenWidth(context:context,inputWidth:8),),
          child:Image.network(url_image+ product.images[index]),
          duration:defaultDuration,
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(10),
            border:Border.all(
              color:kPrimaryColor.withOpacity(controller.selectedImage == index ? 1 : 0)
            ),
          ),
        ),
      ),
    );
  }
}

