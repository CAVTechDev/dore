// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class ConfirmCompany extends StatelessWidget {

  final VoidCallback onNextPressed;

  const ConfirmCompany({super.key, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),

      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            width: 70,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5)
            ),
          ),

          SizedBox(height: 50,),
          InkWell(
            onTap: onNextPressed,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Icon(Icons.location_city,size: 50,),
          
                SizedBox(width: 10,),
          
                  //company name
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    
                    Text("Dore Limited", style: TextStyle(fontSize: 16),),
                    
                    Row(
                      children: [
                        Text("10 mins", style: TextStyle(fontSize: 10),),
                        Row(
                          children: [
                            Icon(Icons.person_outline_outlined),
                            Text("1", style: TextStyle(fontSize: 10),),
                          ],
                        )
                      ],
                    )
                  ],
                 )
                ],
              ),
            ),
          ),

        
        ],
      ),
    );

  }
}