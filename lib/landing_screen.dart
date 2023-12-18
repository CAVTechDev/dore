// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'onboarding.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override

  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 15), (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return OnBoardingScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 60, 207, 158),
        child: Center(
          child: Text("DORE", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold,letterSpacing: 3),),
        ),
      ),
    );
  }
}