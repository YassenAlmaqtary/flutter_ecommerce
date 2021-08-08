import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/constants.dart';
import 'package:mystore/model/product.dart';

class  ProductImages extends StatefulWidget {
  final Product product;

  const ProductImages({Key key, @required this.product}) : super(key: key);

  @override
  _ProductImagesState createState() =>_ProductImagesState();
}

class _ProductImagesState extends State< ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width:getProportionateScreenWidth(context:context,inputWidth:238),
          child: AspectRatio(
            aspectRatio:1,
            child:Hero(
              tag:widget.product.title.toString(),
              child: Image.asset(widget.product.images[selectedImage]),

            ),

          ),
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
           ...List.generate(widget.product.images.length, (index){
             return buildSmallProductPreview(index:index);
           })
          ],
        )
      ],
    );
  }
  GestureDetector buildSmallProductPreview({int index}){
    return GestureDetector(
      onTap:(){
        setState(() {
         selectedImage=index;
        });
      },
      child:AnimatedContainer(
        margin:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:15),),
        width:getProportionateScreenWidth(context:context,inputWidth:48),
        height:getProportionateScreenWidth(context:context,inputWidth:48),
        padding:EdgeInsets.all(getProportionateScreenWidth(context:context,inputWidth:8),),
        child:Image.asset(widget.product.images[index]),
        duration:defaultDuration,
        decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(10),
          border:Border.all(
            color:kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)
          ),
        ),
      ),
    );
  }
}

