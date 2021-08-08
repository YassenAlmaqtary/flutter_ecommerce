import 'package:flutter/material.dart';
import '../../enum.dart';
import './components/body.dart';
import 'package:mystore/components/coustom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Body(),
      bottomNavigationBar:CustomBottomNavBar(selectedMenu:MenuState.home,)
    );
  }
}
