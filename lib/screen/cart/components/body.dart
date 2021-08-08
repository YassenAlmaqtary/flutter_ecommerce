import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/card.dart';
import './cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(context: context, inputWidth: 20)),
        child: ListView.builder(
          itemBuilder: (cntext, index) {
            return Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
             //key:ValueKey<int>(demoCarts[index].product.id),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection directio) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(cart: demoCarts[index]),
            );
          },
          itemCount: demoCarts.length,
        ),
      ),
    );
  }
}
