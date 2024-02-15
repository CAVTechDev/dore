// ignore_for_file: unused_field, unused_element, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable

import 'dart:async';

import 'package:dore/assistants/assistants.dart';
import 'package:dore/authentication/authentication.dart';
import 'package:dore/components/drawertile.dart';
import 'package:dore/components/page_transition.dart';
import 'package:dore/customer_pages/drawer_pages/marketplace.dart';
import 'package:dore/customer_pages/drawer_pages/support.dart';
import 'package:dore/customer_pages/drawer_pages/trip_history.dart';
import 'package:dore/components/main_page_container/location_container.dart';
import 'package:dore/customer_pages/main_pages/destination.dart';
import 'package:dore/global/global.dart';
import 'package:dore/global/mapkey.dart';

import 'package:dore/supervisor_pages/opening_pages/login.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../infoHandler/app_info.dart';
import '../../models/directions.dart';
import '../drawer_pages/about.dart';
import '../drawer_pages/payment.dart';
import '../drawer_pages/profile.dart';
import 'package:location/location.dart' as loc;


class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  void signOut() async{
    firebaseAuth.signOut();
  }

  late GoogleMapController mapController;

  final pickupController = TextEditingController();
  final PageController _controller = PageController();

//initial camera position

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.465422, 3.406448),
    zoom: 14.4746,
  );


   
  // final LatLng _center = const LatLng(6.465422, 3.406448);


  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

 

  //new vars
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  double searchLocationContainerHeight = 220;
  double waitingResponsefromDriverContainerHeight = 0;
  double assignedDriverInfoContainerHeight = 0;

  //position
  Position? userCurrentPosition;
  var geolocation = Geolocator();
  

  LocationPermission? _locationPermission;
  double bottomPaddingofMap = 0;

  List<LatLng> plineCoordinatedList = [];
  Set<Polyline> polylineSet = {};


  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};


  String? userName;
  String? userEmail;


  bool openNavigationDrawer = true;

  bool activeNearbyDriversKeysLoaded = false;

  BitmapDescriptor? activeNearbyIcon;
  

  locateUserPosition() async{
    LocationPermission permission = await Geolocator.requestPermission();
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latlngPosition = LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    CameraPosition cameraPosition = CameraPosition(target: latlngPosition);


    newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String humanReadableAdrress = await AssistantModels.searchAddressforGeographicCoordinates(userCurrentPosition!, context);
    // print("This is your current location" + humanReadableAdrress);

    // userName = userModelCurrentInfo!.name!;
    // userEmail = userModelCurrentInfo!.email!;

    // initializeGoeFireListener();

    // AssistantModels.readTripsKeyForOnlineUser(context);


  }


  // getAddressfromLatLng() async {

  //   try{

  //     GeoData data = await Geocoder2.getDataFromCoordinates(
  //       latitude: userCurrentPosition!.latitude, 
  //       longitude: userCurrentPosition!.longitude,
  //       googleMapApiKey: mapKey,

  //       );

  //   setState(() {
  //     // Directions userPickupAddress = Directions();
  //     // userPickupAddress.locationLatitude = pickLocation!.latitude;
  //     // userPickupAddress.locationLongitue = pickLocation!.longitude;
  //     // userPickupAddress.locationName = data.address;

  //     // Provider.of<AppInfo>(context, listen: false).updatePickUpLocationAddress(userPickupAddress);

  //     _address = data.address;
  //   });

  //   } catch(e) {
  //     print(e);
  //   }
  // }


  checkifLocationPermissionAllowed() async {
    
    if(_locationPermission == LocationPermission.denied){
      _locationPermission = await Geolocator.requestPermission();
    }
  }


  @override
  void initState(){
    super.initState();

    checkifLocationPermissionAllowed();
  }
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: _globalKey,
          body: Stack(
            children: [
              GoogleMap(
              mapType: MapType.normal,  
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              polylines: polylineSet,
              markers: markersSet,
              circles: circlesSet,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller){
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
      
              setState(() {
                  
                });
                locateUserPosition();
              },
              onCameraMove: (CameraPosition? position) {
                if(pickLocation != position!.target){
                  setState(() {
                    pickLocation = position.target;
                  });
                }
              },
              onCameraIdle: () {
                // getAddressfromLatLng();
              },
              
              ),
              
              Align(
                alignment: Alignment.center,
                child:  Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset("images/pick.png", height: 45, width: 45 ,),
                ),
              ),

              
            Positioned(
              top: 10,
              right: 70,
              left: 70,
              child: Container(
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Text("First Technical University",
                overflow: TextOverflow.visible, softWrap: true,),
              ),
            ),
    
    
      
    
//             // UI for Searching location
//             Positioned(
//               bottom: 0,
//               right: 0,
//               left:0,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)
//                       ,),
//                       child: Column(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey.shade100,
//                               borderRadius:  BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.location_on_outlined, color: Colors.blue,),
//                                       SizedBox(width: 20,),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text("From", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold,),),

//                                           Text(Provider.of<AppInfo>(context).userPickupLocation != null
//                                            ? Provider.of<AppInfo>(context).userPickupLocation!.locationName!.substring(0, 24) + "...." 
//                                            : "Not getting address", 
//                                           style: TextStyle(color: Colors.grey, fontSize: 16),)
//                                         ],
//                                       )
//                                     ],
//                                   ),)
// ,
//                                   SizedBox(height: 5,),

//                                   Divider(
//                                     height: 1,
//                                     thickness: 2,
//                                     color: Colors.blue,
//                                   ),

//                                   SizedBox(height: 5,),

//                                   Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: GestureDetector(
//                                       onTap: (){

//                                       },
//                                       child: Row(
//                                     children: [
//                                       Icon(Icons.location_on_outlined, color: Colors.blue,),
//                                       SizedBox(width: 20,),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text("From", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold,),),

//                                           Text(Provider.of<AppInfo>(context).userPickupLocation != null 
//                                           ? Provider.of<AppInfo>(context).userDropOffLocation!.locationName!.substring(0, 24) + "...." 
//                                           : "Not getting address", 
//                                           style: TextStyle(color: Colors.grey, fontSize: 16),)
//                                         ],
//                                       )
//                                     ],
//                                   ), 
//                                     ),
//                                   )
//                               ],
//                             ) ,
//                           )
//                         ],
//                       )
//                     )

//                   ],
//                 ),
//               )),
    

    
    //Drawer button
             Positioned(
              top: 10,
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

             // Pick up from
          
            Positioned(
             
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,50,0,0),
                child: Container(
                          padding: EdgeInsets.all(5),
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
                        
                //Current Location Textfield
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, SlideUpPageRoute(page: SelectDestPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10)
                      ),child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 15,),
                          Text("Pickup From", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13),)
                        ],
                      ),
                    ),
                  ),),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: TextField(
                //     onTap: (){
                //       Navigator.push(context, SlideUpPageRoute(page: SelectDestPage()));
                //     },
                //     decoration: InputDecoration(
                //       fillColor: Colors.grey.shade100,
                //       filled: true,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide: BorderSide.none,
                //       ),
                //       labelText: "Pickup from",
                //       labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 13,),
                //       prefixIcon: Icon(Icons.search,)
                      
                //     ),
                //     controller: TextEditingController(),
                //   ),
                // ),
                SizedBox(height: 40,)        
                          ],
                        ),
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
              child: Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0), 
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
                          Text("Oreoluwa", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
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
                        return MarketPlaceHome();
                      }));
                    },
                    child: DrawerTile(name: "Marketplace", icon: Icon(Icons.sell),)),
      
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
                  SizedBox(height: 240,),
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
                  ),
      
                  TextButton(onPressed: (){
                      signOut();
                  }, child: Text("Sign Out", 
                  style: TextStyle(color: Colors.red[500], fontSize: 16),))
      
                ],
              ),
              
              
              ),
            
            ),
          ),
        ),
      ),
    );
  }
}