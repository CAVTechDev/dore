// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';


class ConfirmLocation extends StatelessWidget {

  final VoidCallback onNextPressed;

  const ConfirmLocation({super.key, required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
            ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("Confirm Pickup",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.grey.shade300, thickness: 1,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  leading: Icon(Icons.check_box_rounded,color: Color.fromARGB(255, 60, 207, 158),),
                  title: Text("Ringroad Ibadan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                  trailing: Icon(Icons.edit),
                ),
              ),
    
    
              // confirm button
    
              SizedBox(height: 15),
              InkWell(
                onTap: onNextPressed,
                child: Container(
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 60, 207, 158),
              
                  ),
                  child: Text("Cofirm", style: TextStyle(color: Colors.white, fontSize: 15),),
                ),
              )
            ],
          ),
          )
          
          ;
  }
}