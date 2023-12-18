// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 100,),
          Image.asset("images/3.jpg"),
          SizedBox(height: 30,),
          Text("There shall be showers of blessing, shut uo mahn")
        ],
      ),
    );
  }
}