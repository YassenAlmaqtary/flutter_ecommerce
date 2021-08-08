import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/components/custom_surffix_icon.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/components/form_error.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/helper/keyboard.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/forgot_password/forgot_password_screen.dart';
import '../../../constants.dart';
import '../../../controller/auth/user_controller.dart';
class SignForm extends StatelessWidget {

  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init:UserController(),
      builder:(controller)=> Form(
        key: _fromKey,
        child: Column(
          children: [
            buildEmailFormField(context:context),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            buildPasswordFormField(context:context),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            Row(
              children: [
                Checkbox(
                  value: controller.remember,
                  activeColor: kPrimaryColor,
                  onChanged:controller.rememberChaing,
                ),
                Text(LocaleztionApp.of(context).getlangTitle("remember_me")),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    LocaleztionApp.of(context).getlangTitle("forgot_password"),
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: controller.errors),
            SizedBox(
              height:
              getProportionateScreenHeight(context: context, inputHeight: 30),
            ),
            defultBoutm(
                context: context,
                text: LocaleztionApp.of(context).getlangTitle("continue"),
                press: () {
                  if (_fromKey.currentState.validate()) {
                    _fromKey.currentState.save();
                    controller.logIn(context:context);
                    KeyboardUtil.hideKeyboard(context);
                  }
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailFormField({BuildContext context}) {
    return GetBuilder<UserController>(
      builder:(Controller)=> TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => Controller.email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            Controller.removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            Controller.removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            Controller.addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            Controller.addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(
                    context: context, inputWidth: 10)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(context: context, inputWidth: 30))
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(context: context, inputWidth: 30))
            ),
            labelText: LocaleztionApp.of(context).getlangTitle("email"),
            hintText: LocaleztionApp.of(context).getlangTitle("enter_your_email"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(
              svgIcon: "assets/icons/Mail.svg",
            )),
      ),
    );
  }

  Widget buildPasswordFormField({BuildContext context}) {
    return GetBuilder<UserController>(
      builder:(controller)=> TextFormField(
        obscureText: true,
        onSaved: (newValue) => controller.password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller.removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            controller.removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            controller.addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            controller.addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(context: context, inputWidth: 30))
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(context: context, inputWidth: 30))
            ),
            labelText: LocaleztionApp.of(context).getlangTitle("password"),
            hintText: LocaleztionApp.of(context).getlangTitle(
                "enter_your_password"),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(
              svgIcon: "assets/icons/Lock.svg",
            )),
      ),
    );
  }
}

