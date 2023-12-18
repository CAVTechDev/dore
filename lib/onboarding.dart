// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:dore/customer_pages/opening_pages_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_pages/intro1.dart';
import 'onboarding_pages/intro2.dart';
import 'onboarding_pages/intro3.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();
  bool OnLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("SKIP", style: TextStyle(color: Colors.green[500], fontSize: 16, fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
            ),
            PageView(
              controller: _controller ,
              onPageChanged: (index) {
                setState(() {
                  OnLastPage = (index == 2);
                });
              },

              children: [IntroPage1(), IntroPage2(), IntroPage3()],
            ),

            Container(
              alignment: Alignment(0,0.8),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CustomerLogin();
                      }));
                    },
                    child: Text("Skip")),
                  SmoothPageIndicator(controller: _controller, count: 3,),
                  
                  OnLastPage?
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CustomerLogin();
                      }));
                    },
                    child: Text("Done"),
                  )
                  :
                  GestureDetector(
                    onTap: (){
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text("Next"),
                  )
              
                ],
              ),
            )
          ],
        ),
        
      ),
    );
  }
}