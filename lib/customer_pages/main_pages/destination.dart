// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:dore/customer_pages/main_pages/confirm_pickup.dart';
import 'package:flutter/material.dart';




class SelectDestPage extends StatelessWidget {
  const SelectDestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel_presentation_sharp, size: 30,)),
                SizedBox(width: 60,),
                Text("Select Company's Destination", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ],
            ),
          

          // location textfield

          SizedBox(height: 40,),

          Row(
            children: [
              Icon(Icons.location_city_outlined, color: Color.fromARGB(255, 60, 207, 158),),
              SizedBox(width: 10,),
              SizedBox(
                width: 320,
               
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none
                      
                    ),
                    suffixIcon: Icon(Icons.cancel,),
                    labelText: "Current Location",
                    labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13,)
                  ),
                ),
              )
            ],
          ),

          //company textfield
          SizedBox(height: 15,),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue),
              SizedBox(width: 10,),
              SizedBox(
                width: 320,
               
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none
                      
                    ),
                   
                    labelText: "Search Company",
                    labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13,)
                  ),
                ),
              )
            ],
          ),

          //select button

          SizedBox(height:500,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ConfirmPickupPage();
              }));
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 207, 158),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Select", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              ),
            ),
          )

          ],
        ),
      )
    );
  }
}