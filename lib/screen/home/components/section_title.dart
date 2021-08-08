import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/localezation_app.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback press;

  const SectionTitle({Key key, @required this.title, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: press,
          child: Text(
            title,
            style: TextStyle(
              fontSize:
                  getProportionateScreenWidth(context: context, inputWidth: 15),
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
           LocaleztionApp.of(context).getlangTitle("see_more"),
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        )
      ],
    );
  }
}
