// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
              
                    //back button
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 20, )),
              
                      //heading
                    SizedBox(height: 15,),
                    Text("About", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold,),),
                    SizedBox(height: 30,),


                    //about tags

                    //rate the app
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(Icons.star_border_outlined,size: 30,),
                      title: Text("Rate the App", style: TextStyle(fontSize: 13),),
                      trailing: Icon(Icons.arrow_forward,),
                    ),
                    
                    Divider(color: Colors.grey.shade600,),
                    SizedBox(height: 10,),

                    //like us on facebook
                     ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(CupertinoIcons.heart),
                      title: Text("Like us on Facebook", style: TextStyle(fontSize: 13),),
                      trailing: Icon(Icons.arrow_forward,),
                    ),
                   
                    Divider(color: Colors.grey.shade600,),
                    SizedBox(height: 10,),


                    // company recommendation
             
                     ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(Icons.build),
                      title: Text("Company Recommendation", style: TextStyle(fontSize: 13),),
                      trailing: Icon(Icons.arrow_forward,),
                    ),
                   
                    Divider(color: Colors.grey.shade600,),
                    SizedBox(height: 10,),


                  // legal
                   ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Icon(CupertinoIcons.slash_circle),
                      title: Text("Legal", style: TextStyle(fontSize: 13),),
                      trailing: Icon(Icons.arrow_forward,),
                    ),
                  
            ],
          ),
        ),
      ),
    );
  }
}