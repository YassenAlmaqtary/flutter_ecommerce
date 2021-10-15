import 'dart:ui';

import './model.dart';

class Vendor implements Model {
  int id;
  String logo, company_name;
  Vendor.fromJson(Map<String, dynamic> map){
    if(map==null)
      return;
    id=map['id'];
    company_name=map['company_name'];
    logo=map['logo'];
  }

  @override
  List<String> GetImages() {

  }

  @override
  String getName() {
   return this.company_name;
  }

  @override
  String getPhto() {
    return this.logo;
  }

  @override
  int getid() {
   return this.id;
  }

  Map toJson(){
    return{'id':id,'company_name':company_name,'logo':logo};
  }

  @override
  List<Color> GetColors() {

  }

}
