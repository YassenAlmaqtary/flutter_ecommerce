import 'package:flutter/material.dart';


class ShowDialog  {
  BuildContext context;
  String title;
  ShowDialog({this.context,this.title}){
    _showMyDialog();
  }

  Future<void>  _showMyDialog(){
    return showDialog<void>(
      context: context,
      barrierDismissible:true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 10.0,
              ),
              Text(title),
            ],
          ),
        );
      },
    );
  }


}
