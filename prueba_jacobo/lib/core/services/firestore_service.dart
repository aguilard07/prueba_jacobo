/*
 * Service class that allows to communicate the app
 * with the Cloud Firestore Database
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';

class FirestoreService {
  //Reference to users collection.
  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  //Method to create a user in the DB.
  Future createUser(User user) async {
    return await usersCollection.document(user.uid).setData(user.toJson());
  }

  //Method to obtain user info from its UID
  Future<DocumentSnapshot> getUserFromUid(String uid) async {
    return await usersCollection.document(uid).get();
  }
}
