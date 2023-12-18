// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';


class RegTextfield extends StatelessWidget {

  final controller;
  final labeltext;
  final bool obscureText;

  const RegTextfield({super.key, required this.controller, required this.labeltext, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: labeltext,
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
                controller: controller,
                obscureText: obscureText,
              );
  }
}