// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {


  MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {


  
  bool obscureText = true;
  
 

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade400)),
                fillColor: Colors.grey.shade100,
                filled: true,
                label: Text("Enter Password"),
                suffixIcon: IconButton(icon: Icon(obscureText? Icons.visibility: Icons.visibility_off,), onPressed: toggleObscureText, focusColor: Color.fromARGB(255, 60, 207, 158),)
              ),
              obscureText: obscureText,
            );
  }
}
