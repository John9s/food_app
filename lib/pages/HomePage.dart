import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/animations/FadeAnimation.dart';
import 'package:food_app/food_model.dart';
import 'package:food_app/pages/details/details-screen.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var selection = 1;
var currency;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

  final  riceList = ListView(
      scrollDirection: Axis.horizontal,
      children: [
    FadeAnimation(1.4, makeItem(food: Food('assets/images/jollof.jpg', "Jollof rice", "5000"))),
    FadeAnimation(1.5, makeItem(food: Food('assets/images/white.jpg', "White rice", "5500"))),
    FadeAnimation(1.6, makeItem(food: Food('assets/images/fried.jpg', "Fried rice", "4500")))]
  );
  final  soupList =
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
        FadeAnimation(1.4, makeItem(food: Food('assets/images/okro.jpg', "Okro soup", "3500"))),
        FadeAnimation(1.5, makeItem(food: Food('assets/images/palm_oil.jpg', "Palm oil soup", "2500"))),
        FadeAnimation(1.6, makeItem(food: Food('assets/images/efo_riro.jpg', "Efo riro", "3000")))],
      );


  final pastaList =
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
        FadeAnimation(1.4, makeItem(food: Food('assets/images/spaghetti.jpg', "Spaghetti", "6000"))),
        FadeAnimation(1.5, makeItem(food: Food('assets/images/linguine.jpg', "Linguine", "5500"))),
        FadeAnimation(1.6, makeItem(food: Food('assets/images/chicken-pasta.jpg', "Chicken pasta", "6500")))],
      );


  final fastfoodList =
      ListView(
        scrollDirection: Axis.horizontal,
        children: [
        FadeAnimation(1.4, makeItem(food: Food('assets/images/one.jpg', "Chicken BBQ Pizza", "2500"))),
        FadeAnimation(1.5, makeItem(food: Food('assets/images/burger.jpg', "Cheese Burger", "2500"))),
        FadeAnimation(1.6, makeItem(food: Food('assets/images/three.jpg', "Beef Pizza", "3000")))],
      );



  var listItems;
  switch(selection){
    case 1:
      listItems = riceList;
      break;
      case 2:
      listItems = soupList;
      break;
      case 3:
      listItems = pastaList;
      break;
      case 4:
      listItems = fastfoodList;
      break;
    default:
      listItems = riceList;
  }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket, color: Colors.grey[800],),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1, Text('Food Delivery', style: TextStyle(color: Colors.grey[80], fontWeight: FontWeight.bold, fontSize: 30),)),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FadeAnimation(1, makeCategory(isActive: true, title: 'Rice', value: 1)),
                          FadeAnimation(1.3, makeCategory(isActive: false, title: 'Soups', value: 2)),
                          FadeAnimation(1.4, makeCategory(isActive: false, title: 'Pasta', value: 3)),
                          FadeAnimation(1.5, makeCategory(isActive: false, title: 'Fast food', value: 4)),
                          FadeAnimation(1.6, makeCategory(isActive: false, title: 'Salad', value: 5)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              FadeAnimation(1, Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Free Delivery', style: TextStyle(color: Colors.grey[700], fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("More >>", style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey[700]),)
                  ],
                ),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 450,
                child: listItems
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title, value}) {
    return InkWell(
      onTap: () => setState((){
        selection = value;
      }),
      child: AspectRatio(
        aspectRatio: isActive ? 3 : 2.5 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: selection == value ? Colors.yellow[700] : Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Align(
            child: Text(title, style: TextStyle(color: selection == value ? Colors.white : Colors.grey[500], fontSize: 18, fontWeight: selection == value ? FontWeight.bold : FontWeight.w100),),
          ),
        ),
      ),
    );
  }

  Widget  makeItem({food}) {
    return AspectRatio(
      aspectRatio: 1.0 / 1.5,
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(food.uri, food.name, food.price))),
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(food.uri),
              fit: BoxFit.cover,
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                 Colors.black.withOpacity(.3),
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: LikeButton(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //circleColor: CircleColor(start: Colors.green, end: Colors.red),
                      //circleSize: 50.0,


                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${getCurrency()} ${food.price}", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(food.name, style: TextStyle(color: Colors.white, fontSize: 20),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getCurrency(){
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString(), name: "NGN");

    currency = format.currencySymbol;
    return format.currencySymbol;
  }
}