// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names

import 'package:dore/infoHandler/app_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {

  
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => AppInfo(),
    child: MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: LandingScreen(
        
      )
    ));
  }
}
