import 'package:flutter/material.dart';

import '../models/directions.dart';

class AppInfo extends ChangeNotifier{
  Directions? userPickupLocation, userDropOffLocation;
  int countTotalTrips = 0;

//   List<String>histroyTripKeysList = [];
//   List<TripsHistoryModel> = allTripsHistoryInformationList = [];


void updatePickUpLocationAddress(Directions userPickupAddress){
  userPickupLocation = userPickupAddress;
  notifyListeners();
}


void updateDropOffLocationAddress(Directions dropOffAddress){
   userDropOffLocation = dropOffAddress;
   notifyListeners();
}
}