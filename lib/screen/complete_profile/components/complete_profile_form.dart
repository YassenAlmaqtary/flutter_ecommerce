import 'package:flutter/material.dart';
import 'package:mystore/components/custom_surffix_icon.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/components/form_error.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/otp/otp_screen.dart';

import '../../../confSize.dart';
import '../../../constants.dart';

class  CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State< CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
     key:_formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(
            height:
            getProportionateScreenHeight(context: context, inputHeight: 30),
          ),
          buildLastNameFormField(),
          SizedBox(
            height:
            getProportionateScreenHeight(context: context, inputHeight: 30),
          ),
          buildPhoneNumberFormField(),
          SizedBox(
            height:
            getProportionateScreenHeight(context: context, inputHeight: 30),
          ),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(
            //height: getProportionateScreenHeight(context: context, inputHeight: 30,
            height:SizeConfig(context).screenHeight*0.1,
          ),

          defultBoutm(
              context:context,
              text:LocaleztionApp.of(context).getlangTitle("continue"),
              press:(){
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }

              }
          ),

        ],
      ),


    );
  }
  buildAddressFormField(){
    return TextFormField(
      onSaved: (newValue) =>address= newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error:kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleztionApp.of(context).getlangTitle("address"),
        hintText: LocaleztionApp.of(context).getlangTitle("phone_address"),
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );

  }



  TextFormField buildPhoneNumberFormField(){
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) =>phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error:kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText:LocaleztionApp.of(context).getlangTitle("phone_number"),
        hintText:LocaleztionApp.of(context).getlangTitle("your_phone_number"),
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }



  buildLastNameFormField(){
    return TextFormField(
      onSaved: (newValue) =>lastName = newValue,
      decoration: InputDecoration(
        labelText: LocaleztionApp.of(context).getlangTitle("last_name"),
        hintText: LocaleztionApp.of(context).getlangTitle("your_last_name"),
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  buildFirstNameFormField(){
    return TextFormField(
      onSaved: (newValue) =>firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
          return null;
      },
      decoration: InputDecoration(
        labelText: LocaleztionApp.of(context).getlangTitle("first_name"),
        hintText:LocaleztionApp.of(context).getlangTitle("your_first_name"),
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(30)
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
