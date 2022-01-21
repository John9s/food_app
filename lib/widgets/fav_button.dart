import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
 // const FavButton({Key? key}) : super(key: key);

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(seconds: 1));
  }
}
