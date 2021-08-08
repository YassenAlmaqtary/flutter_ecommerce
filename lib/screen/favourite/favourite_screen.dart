import 'package:flutter/material.dart';
import 'package:mystore/components/coustom_bottom_nav_bar.dart';
import '../../enum.dart';
import './components/body.dart';
import 'package:mystore/localezation_app.dart';

class FavouriteScreen extends StatelessWidget {
  static String routeName = "/favourite";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.favourite,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        LocaleztionApp.of(context).getlangTitle("title_favourite"),
        // AppLocalizations.of(context).card,
        style: TextStyle(
            color: Color(0xffc1c1c1),
            fontWeight: FontWeight.bold,
            fontSize: 20.0),
      ),
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Color(0xffA9A9A9),
        iconSize: 20,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
