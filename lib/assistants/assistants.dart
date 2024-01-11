// ignore_for_file: unused_local_variable

import 'package:dore/assistants/request_assistant.dart';
import 'package:dore/global/global.dart';
import 'package:dore/models/usermodels.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';

import '../global/mapkey.dart';
import '../models/directions.dart';

class AssistantModels {


  static void readCurrentUserOnlineInfo() async{
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);


    userRef.once().then((snap) {
      if(snap.snapshot.value != null){
        userModelCurrentInfo = UserModel.fromSnapshot(snap.snapshot);
      }
    });
  }

  static Future<String> searchAddressforGeographicCoordinates(Position position, context) async{

    String apiUrl = "https://https.googleapis.com/maps/api/geocode/jason?latlng=${position.latitude}, ${position.latitude}&key=$mapKey";

    String humanReadableAdrress = " ";


    var requestResponse = await RequestAssistant.receiveRequest(apiUrl);

    if(requestResponse != "Error occured! Failed. No Response")
    {
      humanReadableAdrress = requestResponse['results'][0]['formated address'];  

      Directions userPickupAddress = Directions();
      userPickupAddress.locationLatitude = position.latitude;
      userPickupAddress.locationLongitue = position.longitude;
      userPickupAddress.locationName = humanReadableAdrress;
    }
    return humanReadableAdrress;
    
  }
}