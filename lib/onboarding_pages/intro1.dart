// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50,),
          Image.asset("images/4.jpg"),
          SizedBox(height: 20,),
          Text("""
On a mission to return the earth to it's natural state, blah
""")
        ],
      ),
    );
  }
}