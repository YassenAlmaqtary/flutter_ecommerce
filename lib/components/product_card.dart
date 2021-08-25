
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/product.dart';
import '../constants.dart';
import 'package:mystore/screen/details/details_screen.dart';


class ProductCard extends StatefulWidget {
  final double width, aspectRetio;
  final Product product;
  const ProductCard({Key key, this.width=140, this.aspectRetio, this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(
              context: context, inputWidth: 20)),
      child: SizedBox(
        width: getProportionateScreenWidth(
            context: context, inputWidth:widget.width),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, DetailsScreen.routeName,arguments:ProductDetailsArguments(product:widget.product),);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(
                        context: context, inputWidth: 20),
                  ),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: widget.product.id.toString(),
                    child: Image.network(url_image+widget.product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.product.rating}",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(
                            context: context, inputWidth: 18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                        },
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
                            widget.product.isFavourite=!widget.product.isFavourite;
                            if(widget.product.isFavourite)
                              products_favoruties.add(widget.product);
                              else
                                products_favoruties.remove(widget.product);

                          });
                        },
                        child:Container(
                          width:getProportionateScreenWidth(context:context,inputWidth:28),
                          height:getProportionateScreenWidth(context:context,inputWidth:28),
                          padding:EdgeInsets.all(getProportionateScreenWidth(context:context,inputWidth:8),),
                          decoration:BoxDecoration(
                            color:widget.product.isFavourite?kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                          ),
                          child:SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                            color: widget.product.isFavourite
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
