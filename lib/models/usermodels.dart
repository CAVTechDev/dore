

import 'package:firebase_database/firebase_database.dart';

class UserModel{
  String? phone;
  String? id;
  String? name;
  String? address;
  String? email;


  UserModel({
    this.name,
    this.id,
    this.phone,
    this.address,
    this.email,
  });

  UserModel.fromSnapshot(DataSnapshot snap){

    phone = (snap.value as dynamic)["phone"];
    id = snap.key;
    name = (snap.value as dynamic)["name"];
    address = (snap.value as dynamic)["address"];
    email = (snap.value as dynamic)["email"];

  }
}