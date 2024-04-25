// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field



import 'dart:async';

import 'package:dore/components/main_page_container/company_container.dart';
import 'package:dore/components/main_page_container/location_container.dart';
import 'package:dore/components/main_page_container/supervisor_connect_cont.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;


class ConfirmPickupPage extends StatefulWidget {
  const ConfirmPickupPage({super.key});

  @override
  State<ConfirmPickupPage> createState() => _ConfirmPickupPageState();
}

class _ConfirmPickupPageState extends State<ConfirmPickupPage> {

  late GoogleMapController mapController;

 final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  List<LatLng> plineCoordinatedList = [];
  Set<Polyline> polylineSet = {};


  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};

  
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;


 Position? userCurrentPosition;
  var geolocation = Geolocator();

  final LatLng _center = const LatLng(6.465422, 3.406448);

  final PageController _pageController = PageController();

  int _currentPage = 0;

  // void _onMapCreated (GoogleMapController controller) {
  //   mapController = controller;
  // }


locateUserPosition() async{

    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latlngPosition = LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    CameraPosition cameraPosition = CameraPosition(target: latlngPosition);


    newGoogleMapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

}
   static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.465422, 3.406448),
    zoom: 14.4746,
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            Positioned(
            top: 30,
            left: 10,     
             child: Container(
              decoration: BoxDecoration(
                color: Colors.white, 
                shape: BoxShape.circle,
                
                
              ),
              child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.blue,), 
              onPressed: ()
              {
               Navigator.pop(context);
              },),
             ),
           ),



// container
           Positioned(
           bottom: 0,
           left: 0,
           right: 0,
             child: Padding(
               padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
               child: PageView(
                controller: _pageController,
                onPageChanged: (index){
                  setState(() {
                    _currentPage = index;
                  });
                },
                 children: [
                   ConfirmLocation(onNextPressed: (){
                    _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                   }),
                   ConfirmCompany(onNextPressed: () { 
                    _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                   }),
                   ConnectSupervisor(onNextPressed: (){
                    _pageController.nextPage(duration: Duration(milliseconds: 50), curve: Curves.easeIn);
                   },),
                   
                   
                 ],
               ),
             ),
           )


        

        ],
      ),
    );
  }
}