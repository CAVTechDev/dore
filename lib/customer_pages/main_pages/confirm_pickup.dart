// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field



import 'package:dore/components/main_page_container/company_container.dart';
import 'package:dore/components/main_page_container/location_container.dart';
import 'package:dore/components/main_page_container/supervisor_connect_cont.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ConfirmPickupPage extends StatefulWidget {
  const ConfirmPickupPage({super.key});

  @override
  State<ConfirmPickupPage> createState() => _ConfirmPickupPageState();
}

class _ConfirmPickupPageState extends State<ConfirmPickupPage> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.465422, 3.406448);

  final PageController _pageController = PageController();

  int _currentPage = 0;

  void _onMapCreated (GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)),

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
            top: 650,
            left:  0,
            right: 0,
            bottom: 0,
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
                 ConnectSupervisor(),
                 
                 
               ],
             ),
           )


        

        ],
      ),
    );
  }
}