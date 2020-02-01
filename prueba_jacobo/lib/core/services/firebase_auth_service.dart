/*
 * Service class that allows to communicate the app
 * with the Firebase Authentication Service
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';

class FirebaseAuthService {
  final _firestoreService;
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuthService({@required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  //Method to create an User object from a FirebaseUser object
   User userFromFirebase(FirebaseUser user) {
        return user == null ? null : User(uid: user.uid);
    }

  //Method to detect a change in the User Stream.
  Stream<User> get onAuthStateChanged {
    print('Estoy aquí');
    return _firebaseAuth.onAuthStateChanged.map(userFromFirebase);
  }

  //Method to sign-in with password and email.
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User fbUser = userFromFirebase(result.user);
      DocumentSnapshot userDoc =
          await _firestoreService.getUserFromUid(fbUser.uid);
      fbUser.fillElementsFromJson(userDoc.data);
      return fbUser;
    } catch (e) {
      return null;
    }
  }

  //Method to register a user with email and password.
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      User fbUser = userFromFirebase(result.user);

      return fbUser;
    } catch (e) {
      //De haber un error, lo imprime en la consola.
      print(e.toString());
      return null;
    }
  }

  //Sign Out method.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
