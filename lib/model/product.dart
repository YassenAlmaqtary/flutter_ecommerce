import 'package:flutter/material.dart';
import './model.dart';

class Product implements Model{
   int id,rating;
   String title,description;
   List<String> images=[];
   List<Color> colors;
   double price ;
  bool isFavourite, isPopular;
  String category;

  Product(

  {
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.images,
      @required this.colors,
      @required this.rating,
      @required this.price,
      @required this.isFavourite,
      @required this.isPopular,
      @required this.category,


    
      });


  Product.fromJson(Map map){
    if(map==null)
      return;
    this.id=map['id'];
    this.title=map['name'];

    if(map['photos']!=null)
      for(var photo in map['photos'] ){
        this.images.add(photo['path']);
      }

    this.price=map['price'];
    this.rating=map['quntity'];
    this.description=map['description'];
    this.category=map['subctegory']['name'];
    this.isFavourite=false;
    this.isPopular=false;
    this.colors=[
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
    ];
    

  }



  @override
  List<String> GetImages() {
    return this.images;
  }

  @override
  String getName() {
    return this.title ;
  }

  @override
  String getPhto() {
  }

  @override
  int getid() {
    return this.id;
  }

  Map toJson() {
    return {
      'id':this.id,
      'title':this.title,
      'images':this.images,
      'colors':this.colors,
      'isPopular':this.isPopular,
      'isFavourite':this.isFavourite,
       'category':this.category,
       'rating':this.rating,
       'price':this.price,
       'description':this.description,


    };
  }

}
List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4,
    isFavourite: true,
    isPopular: true,
  ),

  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
      "assets/images/ps4_console_white_1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4,
    isPopular: true,
    isFavourite:false,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4,
    isPopular: true,
    isFavourite: true,

  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4,
    isFavourite: true,
    isPopular:false,
  ),
];

const String description =
"Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";


List<Product>products_favoruties=[];