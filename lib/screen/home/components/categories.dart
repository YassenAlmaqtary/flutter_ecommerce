import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/helper/screen_arguments.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/constants.dart';
import 'package:get/get.dart';
import 'package:mystore/controller/category/main_category_controller.dart';
import 'package:mystore/screen/Category/sub_categorys_screen.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/tshirt.svg",
        "text": LocaleztionApp.of(context).getlangTitle("clotheas")
      },
      {
        "icon": "assets/icons/Bill Icon.svg",
        "text": LocaleztionApp.of(context).getlangTitle("bill")
      },
      {
        "icon": "assets/icons/Game Icon.svg",
        "text": LocaleztionApp.of(context).getlangTitle("game")
      },
      {
        "icon": "assets/icons/Gift Icon.svg",
        "text": LocaleztionApp.of(context).getlangTitle("daily_gift")
      },
      {
        "icon": "assets/icons/Discover.svg",
        "text": LocaleztionApp.of(context).getlangTitle("more")
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
              getProportionateScreenWidth(context: context, inputWidth: 0)),
      child: GetBuilder<MainCategoryController>(
        init: MainCategoryController(),
        builder: (controller) => controller.load.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                        context: context, inputWidth: 35)),
                width: getProportionateScreenWidth(
                    context: context, inputWidth: 500),
                height: getProportionateScreenWidth(
                    context: context, inputWidth: 90),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      icon: controller.mainCategory[index].photo,
                      //categories[index]["icon"],
                      text: controller.mainCategory[index].name,
                      //categories[index]["text"],
                      press: () {
                        Navigator.pushNamed(
                            context, SubCategoresScreen.routeName,
                            arguments: ScreenArguments(
                              model_id:controller.mainCategory[index].translation_of == 0
                                  ? controller.mainCategory[index].id
                                  : controller
                                  .mainCategory[index].translation_of,
                            ));
                      },
                    );
                  },
                  itemCount: controller.mainCategory.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: getProportionateScreenWidth(
                        context: context, inputWidth: 40),
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback press;

  const CategoryCard(
      {Key key, @required this.icon, @required this.text, @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            child: SvgPicture.network(
              url_image + icon,
              color: Color(0xffFF4081),
            ),
            width:
                getProportionateScreenWidth(context: context, inputWidth: 55),
            height:
                getProportionateScreenWidth(context: context, inputWidth: 55),
            padding: EdgeInsets.all(
                getProportionateScreenWidth(context: context, inputWidth: 15)),
            decoration: BoxDecoration(
              color: Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
