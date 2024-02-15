// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, use_build_context_synchronously, unused_import

import 'dart:async';

import 'package:dore/assistants/assistants.dart';
import 'package:dore/customer_pages/opening_pages_login/login_page.dart';
import 'package:dore/global/global.dart';
import 'package:flutter/material.dart';

import 'customer_pages/main_pages/home.dart';
import 'onboarding.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {


  startTimer(){
    Timer(Duration(seconds: 10),() async{
      if(await firebaseAuth.currentUser != null){
        firebaseAuth.currentUser != null? AssistantModels.readCurrentUserOnlineInfo() : null;
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return CustomerLogin();
        })));
      }

      else{
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return OnBoardingScreen();
        })));
      }

    });
  }
  
  @override



  void initState() {
    super.initState();

    startTimer();
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