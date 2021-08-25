import 'package:flutter/material.dart';
import 'package:mystore/components/pro_gride_list.dart';
import 'package:mystore/helper/screen_arguments.dart';
import '../confSize.dart';
import './grid_card.dart';
import 'package:mystore/model/model.dart';

class GridtList extends StatelessWidget {
  List<Model> models;
  String routeName;
  int subcategory_id;

  GridtList({this.models, this.routeName, this.subcategory_id});

  @override
  Widget build(BuildContext context) {
    print(this.models);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .7,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridCard(
          model: models[index],
          press: () {
            this.subcategory_id != null
                ? Navigator.pushNamed(context, this.routeName,
                    arguments: ScreenArguments(
                      subcategory_id: this.subcategory_id,
                      model_id: models[index].getid(),
                    ))
                : Navigator.pushNamed(context, this.routeName,
                    arguments: ScreenArguments(
                      model_id: models[index].getid(),
                    ));
          },
        );
      },
      itemCount: models.length,
      padding: EdgeInsets.only(
          right: getProportionateScreenWidth(context: context, inputWidth: 20)),
    );
  }
}
