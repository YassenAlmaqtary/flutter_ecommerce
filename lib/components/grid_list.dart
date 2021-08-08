import 'package:flutter/material.dart';
import 'package:mystore/components/pro_gride_list.dart';
import '../confSize.dart';
import './grid_card.dart';
import 'package:mystore/model/model.dart';
import '../screen/vendor/vendor_screen.dart';
class GridtList extends StatelessWidget {

  List<Model>models;

  GridtList({this.models});
  @override
  Widget build(BuildContext context) {
    return GridView.builder
      (
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:.7,
          mainAxisSpacing:0,
          crossAxisSpacing:0,
          crossAxisCount:2
      ),
      itemBuilder:(context,index){
        return GridCard(
            model:models[index],
          press:(){
            if(index==0)
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return  ProGridList();
                  }
                  )
              ) ;
          },
        );
      },
      itemCount:models.length,

      padding:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:20)),
    );
  }
}