// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:dore/customer_pages/opening_pages_login/forgot_pass.dart';
import 'package:dore/customer_pages/opening_pages_login/login_page.dart';

import 'package:dore/supervisor_pages/opening_pages/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class SupervisorLogin extends StatefulWidget {


  SupervisorLogin({super.key});

  @override
  State<SupervisorLogin> createState() => _SupervisorLoginState();
}

class _SupervisorLoginState extends State<SupervisorLogin> {

  final _formKey = GlobalKey<FormState>();
bool obscureText = false;

void toogleObscureText(){
  setState(() {
    obscureText = !obscureText;
  });
}

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController IDController = TextEditingController();

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
            


// Forms
             Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  //Email form
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50)
                    ],
                decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color.fromARGB(255, 60, 207, 158))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
                labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,),
                floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 60, 207, 158)),
                suffixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 60, 207, 158),)
              ),
                textDirection: TextDirection.ltr,
                
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text){
                  if (text == null || text.isEmpty){
                    return "Email cannot be empty";
                  }
                  if (EmailValidator.validate(text) == true){
                    return null;
                  }

                  if (text.length > 50){
                    return "Email cannot be more than 50";
                  }
                  return null;
                },
                onChanged: (text){
                  setState(() {
                    emailController.text = text;
                  });
                },
             
        
                  ),
                                  
              
            SizedBox(height: 20,),



            //password form
            TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(15)
              ],
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color.fromARGB(255, 60, 207, 158))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
                label: Text("Password"),
                floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 60, 207, 158)),
                suffixIcon: IconButton(icon: Icon(obscureText?  Icons.visibility: Icons.visibility_off), onPressed: toogleObscureText, color: Color.fromARGB(255, 60, 207, 158),),
              ),
              
              obscureText: obscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text){
                if (text == null || text.isEmpty){
                  return "Password cannot be empty";
                }

                if (text.length < 2){
                  return "Password cannot be less than 2";

                }

                if(text.length > 14){
                  return "Password cannot be more than 14 characters";
                }
                return null;
              },

              onChanged: (text){
                setState(() {
                  passwordController.text = text;
                });
              },
            ),

            SizedBox(height: 20,),


            //office ID form
            TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11)
                    ],
                decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Color.fromARGB(255, 60, 207, 158))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
                labelText: "Office ID",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,),
                floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 60, 207, 158)),
                suffixIcon: Icon(Icons.location_city, color: Color.fromARGB(255, 60, 207, 158),)
              ),
                textDirection: TextDirection.ltr,
                
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text){
                  if (text == null || text.isEmpty){
                    return "Office ID cannot be empty";
                  }
                  if (EmailValidator.validate(text) == true){
                    return null;
                  }

                  if (text.length > 10){
                    return "Office ID cannot be more than 10";
                  }
                  return null;
                },
                onChanged: (text){
                  setState(() {
                    emailController.text = text;
                  });
                },
             
        
                  ),

                ],
              ),
            ),

// Change Login user and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CustomerLogin();
                  }));
                }, child: Text("Customer Login", style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), fontWeight: FontWeight.bold,),)),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ForgotPassword();
                  }));
                }, child: Text("Forgot Password", style: TextStyle(color: Colors.grey.shade400),))
              ],
            ),
            
            SizedBox(height: 20,),


            //login button
            GestureDetector(
              onTap: (){

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
            SizedBox(height: 20,),


          //continue with google or apple  
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
            SizedBox(height: 20,),
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


            //not a member yet
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member yet?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegisterSupervisor();
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