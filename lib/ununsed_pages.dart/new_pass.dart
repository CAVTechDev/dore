// ignore_for_file: prefer_const_constructors

import 'package:dore/components/textfield.dart';
import 'package:dore/customer_pages/opening_pages_login/reset_confirm.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword ({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {



  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,),
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

            SizedBox(height: 40,),
            Text("Create New Password", style: TextStyle(color: Colors.grey.shade700, fontSize: 30, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            
            Text("""
Your new password must be unique from those previously used
""", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
            SizedBox(height: 10,),

            Text("New Password", style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 20,),),
            SizedBox(height: 10,),
            MyTextField(
             
            ),
            SizedBox(height: 20,),
             Text("Confirm Password", style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold, fontSize: 20,),),
             SizedBox(height: 10,),
            MyTextField(),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResetConfirm();
                }));
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 60, 207, 158),
                  ),
                  child: Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}