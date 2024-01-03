// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:dore/customer_pages/opening_pages_login/login_page.dart';
import 'package:dore/customer_pages/opening_pages_login/reset_confirm.dart';
import 'package:dore/global/global.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';




class ForgotPassword extends StatefulWidget {

  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}



class _ForgotPasswordState extends State<ForgotPassword> {


  void _submit() async{
    firebaseAuth.sendPasswordResetEmail(
      email: emailController.text.trim()).then((value) async {
        await Fluttertoast.showToast(msg: "We have sent you an email to recover your password, please check the provided email");

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ResetConfirm();
        }));
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(msg: "Error occured \n ${error.toString()}");
      });
  }
  
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 15,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "images/5.jpg",
            ),
           
            SizedBox(height: 10),
            
         
            Text(
              "Email",
              style: (TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50)
                    ],
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade50,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 60, 207, 158),
                        ),
                      ),
                      labelText: "Enter your email",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                      floatingLabelStyle: TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null){
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

                    onChanged: (text) {
                      setState(() {
                        emailController.text = text;
                      });
                    },
                  ),



                  SizedBox(height: 20,),
        
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _submit();
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 207, 158),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Send Reset Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text("Already have an account?", style: TextStyle(fontSize: 15),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CustomerLogin();
                    }));
                  },
                  child: Text("Login", style: TextStyle(color:Color.fromARGB(255, 60, 207, 158), fontSize: 17, fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
