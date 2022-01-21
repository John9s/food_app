import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar detailsAppBar() {
  return AppBar(
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon:  IconButton(icon: Icon(Icons.share, color: Colors.white,), onPressed: () {},),
        onPressed: () {},
      ),
      IconButton(
        icon:  IconButton(icon: Icon(Icons.more_vert , color: Colors.white, ), onPressed: () {},),
        onPressed: () {},
      ),
    ],
  );
}
