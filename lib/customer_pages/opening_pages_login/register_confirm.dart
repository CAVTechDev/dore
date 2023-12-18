// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dore/customer_pages/opening_pages_login/login_page.dart';
import 'package:flutter/material.dart';


class RegisterConfirm extends StatelessWidget {
  const RegisterConfirm ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 100,),
          Image.asset("images/7.jpg"),
          SizedBox(height: 40,),
          Text("Registration Confirmed", style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), fontSize: 20, fontWeight: FontWeight.bold,),),
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CustomerLogin();
              }));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: Color.fromARGB(255, 60, 207, 158)
              ),
              child: Text("Return to Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
            ),
          )
        ],
      ),
    );
  }
}