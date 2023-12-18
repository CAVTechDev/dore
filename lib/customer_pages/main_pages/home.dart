// ignore_for_file: unused_field, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:dore/components/drawertile.dart';
import 'package:dore/components/page_transition.dart';
import 'package:dore/customer_pages/drawer_pages/support.dart';
import 'package:dore/customer_pages/drawer_pages/trip_history.dart';
import 'package:dore/components/main_page_container/location_container.dart';
import 'package:dore/customer_pages/main_pages/destination.dart';

import 'package:dore/supervisor_pages/opening_pages/login.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../drawer_pages/about.dart';
import '../drawer_pages/payment.dart';
import '../drawer_pages/profile.dart';


class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  late GoogleMapController mapController;

  final pickupController = TextEditingController();

  final LatLng _center = const LatLng(6.465422, 3.406448);

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final PageController _controller = PageController();



  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Stack(
        children: [
          GoogleMap(onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0
          ),),
      
         Positioned(
          top: 30,
          left: 10,
        
         
           child: Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
              
              
            ),
            child: IconButton(icon: Icon(Icons.menu, color: Colors.blue,), 
            onPressed: ()
            {
              _globalKey.currentState!.openDrawer();
            },),
           ),
         ),
      
        Positioned(
          top: 700,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
      height: 150,
      width: double.infinity,
      alignment: Alignment(0, 0.8) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white
      ),
      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            height: 7,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25)
            ),
          ),
          SizedBox(height: 40,),
      
          //Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              onTap: (){
                Navigator.push(context, SlideUpPageRoute(page: SelectDestPage()));
              },
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                labelText: "Pickup from",
                labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13,),
                prefixIcon: Icon(Icons.search,)
                
              ),
              controller: TextEditingController(),
            ),
          )
        ],
      ),
        ),
        ),
      
      
          
        ],
      ),



























      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(30))
        ),
        backgroundColor: Colors.white,
        child: Container(
          child: Padding(padding: EdgeInsets.fromLTRB(20, 70, 20, 20), 
          child: Column(
            children: [
              Row(
                
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, color: Colors.grey.shade600,),
                  ),
                SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Anjola", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ViewProfile();
                          }));
                        },
                        child: Text("View Profile", style: TextStyle(color: Color.fromARGB(255, 60, 207, 158), ),))
                      
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.grey.shade500,),
              SizedBox(height: 20,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PaymentPage();
                  }));
                },
                child: DrawerTile(name: "Payment", icon: Icon(Icons.payment_rounded),)),
              
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return TripHistory();
                  }));
                },
                child: DrawerTile(name: "Trip History", icon: Icon(Icons.history),)),
              
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SupportPage();
                  }));
                },
                child: DrawerTile(name: "Support", icon: Icon(Icons.support),)),
              
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return AboutPage();
                  }));
                },
                child: DrawerTile(name: "About", icon: Icon(Icons.info),)),
              

              SizedBox(height: 20),
              Divider(color: Colors.grey.shade600),
              SizedBox(height: 320,),
              GestureDetector(

                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SupervisorLogin();
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 207, 158),
                    borderRadius: BorderRadius.circular(15)
                    
                  ),
                  child: Text("Sign in as a Supervisor", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              )

            ],
          ),
          
          
          ),
        
        ),
      ),
    );
  }
}