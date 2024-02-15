// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {

  late Image image2;

  @override

  void initState(){
    super.initState();
    image2 = Image.asset("images/2.jpg");
  }
  @override

  void didChangeDependencies(){
    precacheImage(image2.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 100,),
        image2,
        SizedBox(height: 30,),
        Text("On a misssion to do rnonsnorsgn")
      ]),
    );
  }
}