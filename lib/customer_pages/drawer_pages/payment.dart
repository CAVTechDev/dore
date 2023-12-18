// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';




class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {


  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // backicon

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5) ,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.arrow_back_ios, size: 20,)),
              ),


              //payment
              SizedBox(height: 30 ,),
              Text("Payment", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: 
              FontWeight.bold,),),


              //cash tile
              SizedBox(height: 30,),

              ListTile(
                contentPadding: EdgeInsets.only(left: 0, right: 0),
                leading: Icon(Icons.money_outlined, color: Color.fromARGB(255, 60, 207, 158),),
                title: Text("Cash"),
                trailing: Checkbox(
                value:isChecked,
                onChanged: (value){
                  setState(() {
                    isChecked = value!;
                  });
                },
                activeColor: Color.fromARGB(255, 60, 207, 158),
                shape: CircleBorder(),
                ),
              ),

              // divider
              Divider(color: Colors.grey.shade600,),

              // add debit card tile
              InkWell(
                onTap: (){},
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.card_travel_outlined, color: Color.fromARGB(255, 60, 207, 158),),
                  title: Text("Add Debit/credit Card"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}