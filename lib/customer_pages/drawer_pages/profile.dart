// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';


class ViewProfile extends StatelessWidget {
  const ViewProfile ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),

            // top tool bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, size:20,)),
                InkWell(
                  onTap:() {},
                  child: Text("Ëdit Profile", style: TextStyle(color: Colors.lightBlue, fontSize: 13,),))
              ],),
            ),

          // profile picture and info
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                    
                  ),
                  child: Icon(Icons.person, size: 30, color: Colors.grey.shade500,),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Oreoluwa Akanbi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 5,),
                    Text("+2349053458693", style: TextStyle(color: Colors.grey.shade600, fontSize: 12),)
                  ],
                )
              ],
            ),

          ),
          

          // divider
          SizedBox(height: 20,),
          Divider(color: Colors.grey.shade600,),

          // mail Tile
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.mail_outlined),
            title: Text("cisccav@gmail.com", style: TextStyle(fontWeight: FontWeight.bold,),),
            trailing: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 207, 158),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("Edit", style: TextStyle(color: Colors.white, ),),
            ),
          ),
          
          // hometile
         SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold,),),
            trailing: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 207, 158),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text("Add", style: TextStyle(color: Colors.white, ),),
            ),
          ),

          SizedBox(height: 10,),
          Divider(color: Colors.grey.shade600,),

          //Log out Tile
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.logout_outlined, color: Colors.red,),
            title: Text("Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),           
          ),

          // Delete Account Tile
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.delete_outline, color: Colors.red,),
            title: Text("Delete Account", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),           
          ),

                    

          ],
        ),
      ),
    );
  }
}