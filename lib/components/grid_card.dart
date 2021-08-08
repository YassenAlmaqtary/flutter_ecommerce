import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/product.dart';
import 'package:mystore/model/model.dart';
import '../constants.dart';

class GridCard extends StatelessWidget {
  final double width, aspectRetio;

  final Model model;
  final GestureTapCallback press;

  const GridCard(
      {Key key, this.width = 140, this.model, this.press,this.aspectRetio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left:
              getProportionateScreenWidth(context: context, inputWidth: 20)),
      child: SizedBox(
        width: getProportionateScreenWidth(
            context: context, inputWidth: width),
        child: GestureDetector(
          onTap: press,

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
                    tag: model.getid().toString(),
                    child: Image.network(url_image+model.getPhto()),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  model.getName(),
                  style: TextStyle(color: Colors.black,fontSize:getProportionateScreenWidth(context:context,inputWidth:22)),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
