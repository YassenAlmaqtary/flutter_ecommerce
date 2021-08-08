import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';

class FormError extends StatelessWidget {
  final List<String> errors;

  const FormError({Key key,@required this.errors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:List.generate(errors.length, (index) => formErrorText(error:errors[index],context:context)),
    );
  }

  Row  formErrorText({String error,BuildContext context}) {
   return Row(
     children: [
       SvgPicture.asset("assets/icons/Error.svg",
       width:getProportionateScreenWidth(context:context,inputWidth:14),
        height:getProportionateScreenHeight(context:context,inputHeight:14),
       ),
       SizedBox(width:getProportionateScreenWidth(context:context,inputWidth:10),),
       Text(error)
     ],

   );
  }
}
