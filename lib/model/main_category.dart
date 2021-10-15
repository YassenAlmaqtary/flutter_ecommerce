
import 'dart:ui';

import './model.dart';

class MainCategory implements Model{
 String name,photo;
 int id,translation_of;

 MainCategory({this.name, this.photo, this.id,this.translation_of});

 MainCategory.fromJson(Map<String, dynamic> map){
  if(map==null)
   return;
   id=map['id'];
   name=map['name'];
   photo=map['photo'];
   translation_of=map['translation_of'];
 }

   Map toJson(){
    return{'id':id,'name':name,'photo':photo,'translation_of':translation_of};
 }

  @override
  List<String> GetImages() {

  }

  @override
  String getName() {
   return this.name;
  }

  @override
  String getPhto() {
   return this.photo;
  }

  @override
  int getid() {
    return this.id;
  }

  @override
  List<Color> GetColors() {

  }

}