// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dore/components/history_tile.dart';
import 'package:flutter/material.dart';


class TripHistory extends StatelessWidget {
  const TripHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),

                //back button
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 20, )),

                  //heading
                SizedBox(height: 15,),
                Text("Trip History", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,),),
                SizedBox(height: 10,),
      
                //Month
                Text("August 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                SizedBox(height: 5,),
      
                //History Tile
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
      
                Text("July 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                SizedBox(height: 5,),
      
                //History Tile
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
      
                Text("June 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                SizedBox(height: 5,),
      
                //History Tile
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                
      
                Text("May 2023", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                SizedBox(height: 5,),
      
                //History Tile
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
                HistoryTile(date: "24 Aug", price: "N0.00", company: "Dore Limited",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}