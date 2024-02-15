// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  late Image image3;
  @override
  void initState(){
    super.initState();
    image3 = Image.asset("images/3.jpg");
  }

  @override

  void didChangeDependencies(){
    precacheImage(image3.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 100,),
          image3,
          SizedBox(height: 30,),
          Text("There shall be showers of blessing, shut uo mahn")
        ],
      ),
    );
  }
}