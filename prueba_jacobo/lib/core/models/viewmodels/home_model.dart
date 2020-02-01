import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/base_model.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';

class HomeModel extends BaseModel {
  FirestoreService _firestoreService;
  FirebaseAuthService _firebaseAuthService;
  User _user;

  HomeModel(
      {@required FirestoreService firestoreService,
      @required User user,
      @required FirebaseAuthService firebaseAuthService}) {
    _firebaseAuthService = firebaseAuthService;
    _firestoreService = firestoreService;
    _user = user;
  }

  String get username => _user.fullname;

  void getUserFromUid() async {
    setBusy(true);
    DocumentSnapshot userDoc = await _firestoreService.getUserFromUid(_user.uid);
    print(userDoc.data);
    _user.fillElementsFromJson(userDoc.data);
    setBusy(false);
    notifyListeners();
  }

  //SignOut method
  void signOut() async {
    setBusy(true);
    await _firebaseAuthService.signOut();
    setBusy(false);
    notifyListeners();
  }
}
