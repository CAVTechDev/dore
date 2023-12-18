// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dore/customer_pages/opening_pages_login/otp.dart';
import 'package:flutter/material.dart';




class ForgotPassword extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 15,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/5.jpg",
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              """Don't worry! 8 accounts. Please enter the email account linked to all your accounts""",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: (TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade50,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.purple,
                  ),
                ),
                labelText: "Enter your email",
                labelStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.mail,
                ),
                floatingLabelStyle: TextStyle(color: Colors.black),
              ),
              controller: emailController,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return OTPPage();
                })));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 207, 158),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Send Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
