// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SupportTags extends StatelessWidget {

  final String supporttagname;
  const SupportTags({super.key, required this.supporttagname});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(supporttagname),
                      Icon(Icons.arrow_forward_ios,)
                    ],
                  )
                 
              ;
  }
}