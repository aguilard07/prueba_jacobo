import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/base_model.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';

class SignInModel extends BaseModel {
  final FirebaseAuthService _firebaseAuthService;

  //Constructor: firebaseAuthService es un parámetro requerido.
  SignInModel({@required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

  //Función para iniciar sesión.
  Future<User> login(String email, String password) async {
    setBusy(true);
    //Llamando al servicio de autenticación para iniciar sesión.
    User user =
        await _firebaseAuthService.signInWithEmailAndPassword(email, password);
    setBusy(false);
    notifyListeners();
    return user;
  }
}
