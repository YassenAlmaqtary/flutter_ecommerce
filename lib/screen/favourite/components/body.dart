import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/product.dart';
import '../../../constants.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:4)),
      child:Column(
      children: [
        ...List.generate(products_favoruties.length, (index) =>
            _bulidCard(favourite:products_favoruties[index])
        )

      ],

      ),

      ),
    );
  }

  Widget _bulidCard({Product favourite}){

    return  SizedBox(
      width:double.infinity,
      height:getProportionateScreenHeight(context:context,inputHeight:130),
      child: Card(
        child:Padding(
          padding:  EdgeInsets.all(getProportionateScreenWidth(context:context,inputWidth:5.0),),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio:.99,
                child: Container(
                  //margin:EdgeInsets.all(getProportionateScreenWidth(context: context,inputWidth:2)),
                  child: Image.network(favourite.images[0]),
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    // border:Border.all(color:c)
                    color:kSecondaryColor.withOpacity(0.1),

                  ),
                  //
                ),
              ),
              SizedBox(
                width:getProportionateScreenWidth(context:context,inputWidth:150),
                child: Text.rich(
                  TextSpan(
                      text: "${favourite.title}\n",
                      style: TextStyle(color: Colors.black),
                      children:[
                        TextSpan(
                          text:"${favourite.price}",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(
                                  context: context, inputHeight: 18),
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor),
                        )
                      ]
                  ),
                ),
              ),
              _buldRowICon(favourite:favourite),
            ],
          ),
        ),
      ),
    );

  }
  Widget _buldRowICon({Product favourite}){
    return Row(
      children: [
        InkWell(
          onTap:(){},
          child: Container(
            width:getProportionateScreenWidth(context:context,inputWidth:24),
            height:getProportionateScreenWidth(context:context,inputWidth:24),
            decoration:BoxDecoration(
                shape:BoxShape.circle,
                color:kPrimaryColor
            ),
            child:Icon(Icons.add,color:Colors.white,size:15,),
          ),
        ),
        SizedBox(width:10,),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: (){
            setState(() {
              favourite.isFavourite=!favourite.isFavourite;
              if(favourite.isFavourite==false){
                products_favoruties.remove(favourite);
              }
            });
          },
          child:Container(
            width:getProportionateScreenWidth(context:context,inputWidth:28),
            height:getProportionateScreenWidth(context:context,inputWidth:28),
            padding:EdgeInsets.all(getProportionateScreenWidth(context:context,inputWidth:8),),
            decoration:BoxDecoration(
              color:  favourite.isFavourite?kPrimaryColor.withOpacity(0.15)
                 : kSecondaryColor.withOpacity(0.1),
            ),
            child:SvgPicture.asset("assets/icons/Heart Icon_2.svg",
              color: favourite.isFavourite
              ? Color(0xFFFF4848)
              : Color(0xFFDBDEE4),

            ),
          ),
        ),
      ],
    );
  }
}

