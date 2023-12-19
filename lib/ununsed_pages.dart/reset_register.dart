// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SaveReg extends StatelessWidget {
  const SaveReg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
              // name
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Enter your name",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    )),
                controller: TextEditingController(),
                
              ),
              SizedBox(
                height: 10,
              ),


              //mail
              Text("Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Enter your email",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    )),
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 10,
              ),


              //password
              Text("Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Set a Password",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    )),
                controller: TextEditingController(),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),

              //confirm password
              Text("Confirm Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: "Confirm input password",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    floatingLabelStyle: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    )),
                controller: TextEditingController(),
                obscureText: true,
              ),
              SizedBox(
                height: 25,
              ),

        ],
      ),
    );
  }
}