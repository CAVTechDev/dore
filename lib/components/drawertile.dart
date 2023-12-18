// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';


class DrawerTile extends StatelessWidget {

  final icon;
  final String name;

  const DrawerTile({super.key, this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                leading: icon,
                title: Text(name, style: TextStyle(color: Colors.grey.shade700),),
                trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                splashColor: Colors.green[400],
              );
  }
}