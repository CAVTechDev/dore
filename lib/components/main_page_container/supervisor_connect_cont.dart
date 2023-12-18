// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class ConnectSupervisor extends StatelessWidget {
  const ConnectSupervisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
    );
  }
}