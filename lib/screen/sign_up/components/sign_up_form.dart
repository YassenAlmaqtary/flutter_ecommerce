import 'package:flutter/material.dart';
import 'package:mystore/components/custom_surffix_icon.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/components/form_error.dart';
import 'package:mystore/helper/keyboard.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/complete_profile/complete_profile_screen.dart';
import '../../../controller/auth/user_controller.dart';
import 'package:get/get.dart';
import '../../../confSize.dart';
import '../../../constants.dart';

class SignUpForm extends StatelessWidget {

  final _fromKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init:UserController(),
      builder:(conroller)=>Form(
        key: _fromKey,
        child: Column(
          children: [
            buildNameFormField(context: context),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            buildEmailFormField(context: context),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            buildPasswordFormField(context:context),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            buildConformPassFormField(context: context),
            FormError(errors: conroller.errors),
            SizedBox(
              //height: getProportionateScreenHeight(context: context, inputHeight: 30,
              height:SizeConfig(context).screenHeight*0.1,
              ),

            defultBoutm(
                context:context,
                text:LocaleztionApp.of(context).getlangTitle("continue"),
                press:(){
                  if(_fromKey.currentState.validate()){
                    _fromKey.currentState.save();
                    KeyboardUtil.hideKeyboard(context);
                    conroller.SingUp(context: context);
                    Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                  }

                }
            ),

          ],
        ),
      ),
    );
  }

  Widget buildPasswordFormField({BuildContext context}) {
    return GetBuilder<UserController>(
      builder:(conroller)=> TextFormField(
        obscureText: true,
        onSaved: (newValue) =>conroller.password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
           conroller.removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            conroller.removeError(error: kShortPassError);
          }
          conroller. password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            conroller.addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            conroller.addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: LocaleztionApp.of(context).getlangTitle("password"),
          hintText:LocaleztionApp.of(context).getlangTitle("enter_your_password"),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          border:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
        ),
      ),
    );
  }

  Widget buildConformPassFormField({BuildContext context}){
    return GetBuilder<UserController>(
      builder:(controller)=>TextFormField(
        obscureText: true,
        onSaved: (newValue) => controller.conform_password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller.removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            controller. removeError(error: kShortPassError);
          }
          controller.conform_password = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            controller. addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            controller. addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText:LocaleztionApp.of(context).getlangTitle("conform_password"),
          hintText: LocaleztionApp.of(context).getlangTitle("re_enter_your_password"),
          border:OutlineInputBorder(
        borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
      ),
      focusedBorder:OutlineInputBorder(
      borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
      ),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Widget buildNameFormField({BuildContext context}) {
    return GetBuilder<UserController>(
      builder:(controller)=> TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) =>controller.name = newValue,
        onChanged: (value) {
          if (value.isNotEmpty)
            controller. removeError(error:  kNamelNullError);
            return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            controller.addError(error: kNamelNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText:LocaleztionApp.of(context).getlangTitle("name"),
          hintText: LocaleztionApp.of(context).getlangTitle("enter_your_name"),
          border:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }


  Widget buildEmailFormField({BuildContext context}) {
    return GetBuilder<UserController>(
      builder:(controller)=> TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) =>controller.email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller. removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            controller.removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            controller.addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            controller. addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText:LocaleztionApp.of(context).getlangTitle("email"),
          hintText: LocaleztionApp.of(context).getlangTitle("enter_your_email"),
          border:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        ),
      ),
    );
  }

}
