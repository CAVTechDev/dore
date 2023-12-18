// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 100,),
        Image.asset("images/2.jpg"),
        SizedBox(height: 30,),
        Text("On a misssion to do rnonsnorsgn")
      ]),
    );
  }
}