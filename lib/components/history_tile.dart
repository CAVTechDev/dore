// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {

  final String company;
  final String date;
  final String price;

  const HistoryTile({super.key, required this.company, required this.date, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 5,),
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(Icons.history,),
                ),
                title: Text(company, style: TextStyle(fontSize: 13),),
                subtitle: Text(date, style: TextStyle(fontSize: 12),),
                trailing: Text(price, style: TextStyle(fontWeight: FontWeight.bold,),),
              ),
              );
  }
}