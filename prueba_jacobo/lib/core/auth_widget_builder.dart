/*
 * 
 * 
 * 
 * For more info about this approach, please check these videos:
 * https://www.youtube.com/playlist?list=PLNnAcB93JKV-IarNvMKJv85nmr5nyZis8
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';

import 'models/model/user.dart';

class AuthWidgetBuilder extends StatelessWidget {
  final Widget Function(BuildContext, AsyncSnapshot<User>)
      builder; //Builder function.

  AuthWidgetBuilder({@required this.builder});

  @override
  Widget build(BuildContext context) {
    //Initializing Firebase Auth Service
    final FirebaseAuthService firebaseAuthService = Provider.of(context);
    return StreamBuilder<User>(
        stream: firebaseAuthService.onAuthStateChanged, //Listening Stream<User>
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<User>.value(value: user),
              ],
              child: builder(context, snapshot),
            );
          }
          return builder(context, snapshot);
        });
  }
}
