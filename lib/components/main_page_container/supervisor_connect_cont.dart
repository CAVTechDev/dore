// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';


class ConnectSupervisor extends StatelessWidget {

  VoidCallback onNextPressed;

  ConnectSupervisor({super.key, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200
            ),
          ),
          SizedBox(height: 15,),
          
          Text("Connecting you to the Supervisor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

          SizedBox(height: 10,),

          Text("Dore has accepted your booking. Getting through to the supervisor in charge of area....", style: TextStyle(color: Colors.grey.shade500,),),

          SizedBox(height: 10,),

          Row(
            children: [

              
            ],
          )
        ],
      )
    );
  }
}