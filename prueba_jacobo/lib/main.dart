import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';
import 'package:prueba_jacobo/ui/router.dart';
import 'package:prueba_jacobo/ui/views/auth_widget.dart';

import 'core/auth_widget_builder.dart';



void main() {
   WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
   runApp(
    MultiProvider(
      providers: [
        Provider<FirestoreService>.value(value: FirestoreService()),
        ProxyProvider<FirestoreService, FirebaseAuthService>(
          update: (context, firestoreService, firebaseAuthService) => FirebaseAuthService(firestoreService: firestoreService),
        )
      ], 
      child: AuthWidgetBuilder(
        builder: (context, userSnapshot){
          return MaterialApp(
            home: AuthWidget(userSnapshot: userSnapshot),
            onGenerateRoute: Router.generateRoute,
          );
        },
      ),
    )
  );
}

