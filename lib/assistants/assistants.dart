// ignore_for_file: unused_local_variable

import 'package:dore/global/global.dart';
import 'package:dore/models/usermodels.dart';
import 'package:firebase_database/firebase_database.dart';

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
}