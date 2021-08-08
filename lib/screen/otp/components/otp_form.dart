import 'package:flutter/material.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/confSize.dart';
import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpForm createState() => _OtpForm();
}

class _OtpForm extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          SizedBox(height:SizeConfig(context).screenHeight*.15,),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
             SizedBox(
               width:getProportionateScreenWidth(context:context,inputWidth:60),
               child: TextFormField(
                 autofocus: true,
                 textAlign:TextAlign.center,
                 style:TextStyle(fontSize:24),
                 obscureText:true,
                 keyboardType: TextInputType.number,
                 onChanged:(value){
                   nextField(value, pin2FocusNode);
                 },
                 decoration:otpInputDecoration(context:context),

               ),
             ),

              SizedBox(
                width:getProportionateScreenWidth(context:context,inputWidth:60),
                child: TextFormField(
                  textAlign:TextAlign.center,
                  style:TextStyle(fontSize:24),
                  autofocus: true,
                  obscureText:true,
                  keyboardType: TextInputType.number,
                  onChanged:(value){
                    nextField(value, pin3FocusNode);
                  },
                  decoration:otpInputDecoration(context:context),

                ),
              ),
              SizedBox(
                width:getProportionateScreenWidth(context:context,inputWidth:60),
                child: TextFormField(
                  textAlign:TextAlign.center,
                  style:TextStyle(fontSize:24),
                  autofocus:true,
                  obscureText:true,
                  keyboardType: TextInputType.number,
                  onChanged:(value){
                    nextField(value, pin4FocusNode);
                  },
                  decoration:otpInputDecoration(context:context),

                ),
              ),
              SizedBox(
                width:getProportionateScreenWidth(context:context,inputWidth:60),
                child: TextFormField(
                  textAlign:TextAlign.center,
                  style:TextStyle(fontSize:24),
                  autofocus: true,
                  obscureText:true,
                  keyboardType: TextInputType.number,
                  onChanged:(value){
                    if(value.length==1)
                     pin4FocusNode.unfocus();
                  },
                  decoration:otpInputDecoration(context:context),

                ),
              ),
            ],
          ),
          SizedBox(height:SizeConfig(context).screenHeight*.15,),
          defultBoutm(
            context: context,
            text: "Continue",
            press:(){

            }
          )
        ],
      ),
    );
  }


}
