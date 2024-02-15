// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {

  late Image image1;

  @override

  void initState(){
    super.initState();
    image1 = Image.asset("images/4.jpg");
  }

  @override
  void didChangeDependencies(){
    precacheImage(image1.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 50,),
          image1,
          SizedBox(height: 20,),
          Text("""
On a mission to return the earth to it's natural state, blah
""")
        ],
      ),
    );
  }
}