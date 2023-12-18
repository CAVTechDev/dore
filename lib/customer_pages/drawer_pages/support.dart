// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dore/components/support_tags.dart';
import 'package:flutter/material.dart';


class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 20, )),
          //heading
                  SizedBox(height: 15,),
                  Text("Support", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,),),
                  SizedBox(height: 40,),

                  // about Dore
                 SupportTags(supporttagname: ("About Dore")),
                 SizedBox(height: 10,),
                 Divider(color: Colors.grey.shade500,),
                 SizedBox(height: 20,),

                 // app and features
                SupportTags(supporttagname: ("App and Features")),
                 SizedBox(height: 10,),
                 Divider(color: Colors.grey.shade500,),
                 SizedBox(height: 20,),

                 // account and data
                SupportTags(supporttagname: ("Account and Data")),
                 SizedBox(height: 10,),
                 Divider(color: Colors.grey.shade500,),
                  SizedBox(height: 20,),
              

                 // plans and pricing
                SupportTags(supporttagname: ("Plans and Pricing")),
                 SizedBox(height: 10,),
                 Divider(color: Colors.grey.shade500,),
                 SizedBox(height: 20,),

                 //using dore
                 SupportTags(supporttagname: ("Using Dore")),
                 SizedBox(height: 10,),
                 Divider(color: Colors.grey.shade500,),
                 SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}