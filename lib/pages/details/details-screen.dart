import 'package:flutter/material.dart';
import 'package:food_app/pages/details/components/body.dart';
import 'package:food_app/palette/palette.dart';

import 'components/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  String uri;
  String name;
  String price;

  DetailsScreen(this.uri, this.name, this.price);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Palette.primaryColor,
      appBar: detailsAppBar(),
      body: Body(uri, name, price),
    );
  }
}
