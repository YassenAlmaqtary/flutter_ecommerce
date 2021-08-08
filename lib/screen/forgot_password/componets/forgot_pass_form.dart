import 'package:flutter/material.dart';
import 'package:mystore/components/custom_surffix_icon.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/components/form_error.dart';
import 'package:mystore/components/no_account_text,.dart';
import 'package:mystore/localezation_app.dart';
import '../../../confSize.dart';
import '../../../constants.dart';


class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _fromKey = GlobalKey<FormState>();
  String email;
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height:
            getProportionateScreenHeight(context: context, inputHeight: 30),
          ),

          FormError(errors: errors),
          SizedBox(
            height:
            SizeConfig(context).screenHeight*0.1
          ),
          defultBoutm(
              context:context,
              text:LocaleztionApp.of(context).getlangTitle("continue"),
              press:(){
                if(_fromKey.currentState.validate()){

                }

              }
          ),
          SizedBox(
              height:
              SizeConfig(context).screenHeight*0.1
          ),
          NoAccountText(),

      ],
      ),
    );
  }
  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          border:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:30))
          ),
          labelText: LocaleztionApp.of(context).getlangTitle("email"),
          hintText:LocaleztionApp.of(context).getlangTitle("enter_your_email"),
          floatingLabelBehavior:FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }
}

