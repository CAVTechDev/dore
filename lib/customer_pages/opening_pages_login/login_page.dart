// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:dore/customer_pages/opening_pages_login/forgot_pass.dart';
import 'package:dore/customer_pages/opening_pages_login/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../supervisor_pages/opening_pages/login.dart';
import '../main_pages/home.dart';


class CustomerLogin extends StatefulWidget {


  CustomerLogin({super.key});

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
bool obscureText = false;

void toogleObscureText(){
  setState(() {
    obscureText = !obscureText;
  });
}

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                
                
                child: Icon(CupertinoIcons.gift, color:Color.fromARGB(255, 60, 207, 158),size: 50,),)
            ],),
            SizedBox(height: 20,),
            Text("Login to your Account", style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), fontSize: 25, fontWeight: FontWeight.bold,),),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color.fromARGB(255, 60, 207, 158))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
                label: Text("Ëmail"),
                floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 60, 207, 158)),
                suffixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 60, 207, 158),)
              ),
              controller: emailController,
            ),
            SizedBox(height: 30,),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color.fromARGB(255, 60, 207, 158))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
                label: Text("Password"),
                floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 60, 207, 158)),
                suffixIcon: IconButton(icon: Icon(obscureText?  Icons.visibility: Icons.visibility_off), onPressed: toogleObscureText, color: Color.fromARGB(255, 60, 207, 158),),
              ),
              controller: passwordController,
              obscureText: obscureText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SupervisorLogin();
                  }));
                }, child: Text("Supervisor Login", style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), fontWeight: FontWeight.bold,),)),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ForgotPassword();
                  }));
                }, child: Text("Forgot Password", style: TextStyle(color: Colors.grey.shade400),))
              ],
            ),
            
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CustomerHome();
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 207, 158),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
              ),
            ),
            SizedBox(height: 40,),
            
         Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.9,
                    color: Colors.grey.shade400,
                  ),
                ),
                Text("Or continue with", style: TextStyle(color: Colors.grey.shade600),),
                Expanded(child: Divider(color: Colors.grey.shade400,thickness: 0.9,))
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300
                  ),
                  child: Image.asset("assets/apple.png", height: 80,)
                ),
                SizedBox(width: 30,),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10  ),
                    color: Colors.grey.shade300
                  ),
                  child: Image.asset("assets/google.png", height: 80,)
                ),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member yet?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterCustomer();
                  }));
                },
                 child: Text("Register", 
                 style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), fontSize: 16, fontWeight: FontWeight.bold,),))
              ],
            )


      
          ],
        ),
      )
    );
  }
}