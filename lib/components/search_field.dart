import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';


import '../constants.dart';
import '../localezation_app.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig(context).screenWidth * 0.6,
      child: TextFormField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder:InputBorder.none,
          enabledBorder:InputBorder.none,
          hintText: LocaleztionApp.of(context).getlangTitle("search_product"),
          prefixIcon: Icon(Icons.search,color:Colors.black,),
          contentPadding: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(context: context, inputWidth: 20),
            vertical: getProportionateScreenHeight(
              context: context,
              inputHeight: 9,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color:  kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
