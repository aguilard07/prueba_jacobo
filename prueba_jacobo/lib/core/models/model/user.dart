import 'package:flutter/material.dart';

//User model
class User {
  final String uid; //User identificator in Firebase Auth
  String fullname;

  User({@required this.uid, this.fullname});

  //Converts a User object in a JSON array.
  toJson() {
    return {"fullname": fullname};
  }

  //Create a user object from a JSON array.
  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(
      uid: json["uid"],
      fullname: json["fullname"],
    );

    return user;
  }
  //Fill the attributes of user
  void fillElements({String fullname}) {
    this.fullname = fullname;
  }

  //Print all elements of the User object.
  void printAllElements() {
    print("UID: $uid");
    print("Nombre				:	$fullname ");
  }

  //Fill user data from a JSON array
  void fillElementsFromJson(Map<String, dynamic> data) {
    this.fullname = data['fullname'];
  }
}
