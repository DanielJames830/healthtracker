import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthtracker/main.dart';

class WaterPage extends StatelessWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = MyApp.getStyle();
    return Scaffold(
      backgroundColor: style.backGroundColor,
      appBar: AppBar(
        title: Text(
          "My Water",
          style: style.titleFontStyle,
        ),
      ),
    );
  }
}
