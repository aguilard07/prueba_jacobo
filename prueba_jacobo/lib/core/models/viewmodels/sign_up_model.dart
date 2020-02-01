/*
 * Model of the Sign Up View.
 * 
 * It contains the logic of register a user.
 *  
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/base_model.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';

class SignUpModel extends BaseModel {
  FirebaseAuthService
      _firebaseAuthService; //Service to register a user in Firebase Authentication
  FirestoreService
      _firestoreService; //Service to save user data (fullname) in Firestore Database.

  //Constructor: Firebase Auth service and FIrestore service are required params.
  SignUpModel(
      {@required FirebaseAuthService firebaseAuthService,
      @required FirestoreService firestoreService}) {
    _firebaseAuthService = firebaseAuthService;
    _firestoreService = firestoreService;
  }

  Future<User> register(
      {String fullname, String email, String password}) async {
    setBusy(true);
    // Register user in firebase auth with email and password.
    User user = await _firebaseAuthService.registerWithEmailAndPassword(email.trim(), password);
    //If user == null, it means that the email is not unique.
    if (user == null) return null;

    user.fillElements(fullname: fullname);
    //Insert data in the Firestore DB.
    await _firestoreService.createUser(user);
    // Return user data
    setBusy(false);
    notifyListeners();
    return user;
  }
}
