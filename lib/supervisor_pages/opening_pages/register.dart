// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:dore/components/register_textfield.dart';

import 'package:dore/supervisor_pages/opening_pages/register_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterSupervisor extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final occupationController = TextEditingController();
  final addressController = TextEditingController();
  

  RegisterSupervisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(CupertinoIcons.back),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                      child: Icon(
                        CupertinoIcons.gift,
                        size: 30,
                        color: Color.fromARGB(255, 60, 207, 158),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Create a free account",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/google.png",
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/apple.png",
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/facebook.png",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or Sign Up with",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RegTextfield(controller: usernameController, labeltext: 'Enter your name', obscureText: false,),
                SizedBox(height: 10,),
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: emailController, labeltext: "Enter your mail", obscureText: false,),
               SizedBox(height: 10,),
                Text(
                  "Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: addressController, labeltext: "Enter your current address", obscureText: false,),
                SizedBox(height: 10,),
                Text(
                  "Occupation",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: emailController, labeltext: "Enter your current Occupation", obscureText: false,),
                SizedBox(height: 10,),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: emailController, labeltext: "Enter your phone number", obscureText: false,),
                SizedBox(height: 10,),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: emailController, labeltext: "Create a new password", obscureText: true,),
                SizedBox(height: 10,),
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                RegTextfield(controller: emailController, labeltext: "Confirm Password", obscureText: true,),
               
               
               
      
      
      
      
      
      
      
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RegisterConfirmSupervisor();
                    }));
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 60, 207, 158),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
