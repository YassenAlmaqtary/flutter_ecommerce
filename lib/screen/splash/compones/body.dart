import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/controller/auth/user_controller.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/sign/sign_screen.dart';
import 'package:mystore/screen/home/home_screen.dart';
import 'contnens.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData({BuildContext context}) {
    return [
      {
        "text1": LocaleztionApp.of(context).getlangTitle("welcome"),
        "text2": LocaleztionApp.of(context).getlangTitle("to"),
        "text3": LocaleztionApp.of(context).getlangTitle("mystore") + "\n",
        "image": "assets/images/splash_1.png"
      },
      {
        "text1": LocaleztionApp.of(context).getlangTitle("we"),
        "text2": LocaleztionApp.of(context).getlangTitle("help"),
        "text3": LocaleztionApp.of(context)
                .getlangTitle("people_conect_with_store") +
            "\n" +
            LocaleztionApp.of(context).getlangTitle("around_yemen"),
        "image": "assets/images/splash_2.png"
      },
      {
        "text1":LocaleztionApp.of(context).getlangTitle("we_show"),
        "text2":LocaleztionApp.of(context).getlangTitle("the_easy"),
        "text3":LocaleztionApp.of(context).getlangTitle("way_to_shop")+
            "\n"+
            LocaleztionApp.of(context).getlangTitle("Just_stay_at_home_with_us"),
        "image": "assets/images/splash_3.png"
      },
    ];
  }

  int Selectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 15,
          child: PageView.builder(
            onPageChanged: (int value) {
              setState(() {
                Selectindex = value;
              });
            },
            itemCount: splashData(context: context).length,
            itemBuilder: (context, index) => Contnes(
              text1: splashData(context: context)[index]["text1"],
              text2: splashData(context: context)[index]["text2"],
              text3: splashData(context: context)[index]["text3"],
              imagPah: splashData(context: context)[index]['image'],
            ),
          ),
        ),
        Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              splashData(context: context).length, (index) => indcitor(index)),
        ),
        Spacer(
          flex: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(
                  context: context, inputWidth: 20)),
          child: GetBuilder<UserController>(
            init:UserController(),
            builder:(controller){
              return defultBoutm(
                  context: context,
                  text:LocaleztionApp.of(context).getlangTitle("continue"),
                  press: (){
                    if(controller.isAuth.value)
                    Navigator.pushNamed(context,HomeScreen.routeName);
                    else
                    Navigator.pushNamed(context, SignInScreen.routeName);

                  });

            }
          ),

          ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  AnimatedContainer indcitor(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10.0),
      duration: Duration(milliseconds: 5),
      width: Selectindex == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: Selectindex == index ? Color(0xffFF7447) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
