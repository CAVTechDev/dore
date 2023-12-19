// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, use_build_context_synchronously, curly_braces_in_flow_control_structures, unused_import


import 'package:dore/customer_pages/main_pages/home.dart';
import 'package:dore/customer_pages/opening_pages_login/login_page.dart';
import 'package:dore/customer_pages/opening_pages_login/register_confirm.dart';
import 'package:dore/global/global.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterCustomer extends StatefulWidget {

  const RegisterCustomer({super.key});

  @override
  State<RegisterCustomer> createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void _submit() async{
    //validate all fields

    if(_formKey.currentState!.validate()){
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()).then((auth) async {
          currentUser = auth.user;

          if (currentUser != null) {
            Map userMap = {
              "id": currentUser!.uid,
              "name": usernameController.text.trim(),
              "email": emailController.text.trim(),
              "phone": phoneController.text.trim(),
              "address": addressController.text.trim(),
              "password": passwordController.text.trim(),
            };


            DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
            userRef.child(currentUser!.uid).set(userMap);
          }

          await Fluttertoast.showToast(msg: "Successfully Registered");
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CustomerLogin();
          })).catchError((errorMessage){
            Fluttertoast.showToast(msg: "Error occured: \n $errorMessage");
          });

        } );



    }
    else{
      Fluttertoast.showToast(msg: "Not all fields are validated");
    }

  
  }

  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
         
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(CupertinoIcons.back),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                      child: Icon(
                        CupertinoIcons.gift,
                        size: 50,
                        color: Color.fromARGB(255, 60, 207, 158),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Create a free account",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/google.png",
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/apple.png",
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/facebook.png",
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or Sign Up with",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
          
          //forms
          
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
          
                      //username
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                       decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Enter your name",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.person)
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty){
                          return "Name cannot be empty";
                        }
          
                        if (text.length < 2) {
                          return "Please enter a valid name";
                        }
          
                        if(text.length > 49) {
                          return "Name cannot be more than 50"; 
                        }
                        return null;
                      },
                      onChanged: (text) => setState((){
                        usernameController.text = text;
                      }),
                      ),
          
                      SizedBox(height: 10,),
                     
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
          
          
              //email textfield
                SizedBox(height: 10,),
                TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100)
                        ],
                       decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Enter your mail",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.person)
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty){
                          return "Mail cannot be empty";
                        }
          
                       if (EmailValidator.validate(text) == true)
                       {
                        return null; 
                       }
          
                        if(text.length > 99) {
                          return "Mail cannot be more than 50"; 
                        }
                        return null;
                      },
                      onChanged: (text) => setState((){
          
                        emailController.text = text;
                      }),
          
                  
                      ),
      //
      //
      //phone number textfield          
                      SizedBox(height: 10,),
                  Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                      IntlPhoneField(
                        showCountryFlag: false,
                        dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade500,),
                        decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Enter your phone number",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      
                      ),
                      initialCountryCode: 'NIG',
                      onChanged: (text) => setState((){
          
                        phoneController.text = text.completeNumber;
                      }),
                      ),


                      // address textfield

                      Text(
                  "Adress",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
          
          
    
                SizedBox(height: 10,),
                TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(100)
                        ],
                       decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Enter your address",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.location_city)
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty){
                          return "Address cannot be empty";
                        }
          
                       if (text.length < 2){
                        return "Please enter a valid address";
                       }
          
                        if(text.length > 99) {
                          return "Address cannot be more than 100"; 
                        }
                        return null;
                      },
                      onChanged: (text) => setState((){
          
                        addressController.text = text;
                      }),
          
                  
                      ),



          //password textfield
              SizedBox(height: 10),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
          
          
           
                SizedBox(height: 10,),
                TextFormField(
                        obscureText: passwordVisible,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                       decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Set a password",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(icon: Icon(passwordVisible? Icons.visibility : Icons.visibility_off,
                      ),
                      
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },)
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty){
                          return "Passwor cannot be empty";
                        }
          
                      if (text.length < 2){
                        return "Please enter a valid password";
                      }

                        if(text.length > 99) {
                          return "Password cannot be more than 20"; 
                        }
                        return null;
                      },
                      onChanged: (text) => setState((){
          
                        passwordController.text = text;
                      }),
          
                  
                      ),


                      // confirm password textfield

                       SizedBox(height: 10),
                Text(
                  " Confirm Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
          
          
           
                SizedBox(height: 10,),
                TextFormField(
                        obscureText: passwordVisible,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                       decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      labelText: "Confirm password",
                      labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      floatingLabelStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(icon: Icon(passwordVisible? Icons.visibility : Icons.visibility_off,
                      ),
                      
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },)
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (text) {
                        if (text == null || text.isEmpty){
                          return "Confirm Password cannot be empty";
                        }
                      if (text != passwordController.text){
                        return "Password does not match";
                      }
                      if (text.length < 2){
                        return "Please enter a valid password";
                      }

                        if(text.length > 99) {
                          return "Password cannot be more than 20"; 
                        }
                        return null;
                      },
                      onChanged: (text) => setState((){
          
                        confirmpasswordController.text = text;
                      }),
          
                  
                      ),
          
          
                    ],
          
                  ),
                ),
          
          
                SizedBox(height: 30,),
                //register button
                GestureDetector(
                  onTap: () {
                  _submit();
                  },
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 60, 207, 158),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Center(
                  child: Text("Forgot Password?",
                  style: TextStyle(color: Colors.blue[500]),)),
                SizedBox(height: 15,),
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?"),
                    SizedBox(width: 5,),
                    GestureDetector
                    (onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CustomerLogin();
                     }));
                    },
                      
                      child: Text("Login", style: TextStyle(color: Colors.blue[500], fontSize: 16, fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
