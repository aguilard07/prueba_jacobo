/*
 * Widget that leads the user to the homeview if he is authenticated or 
 * to the SignInView if he is not.
 * 
 * userSnapshot is a Stream<User> that detects changes in the authentication.
 * 
 * For more info about this approach, check these videos:
 * https://www.youtube.com/playlist?list=PLNnAcB93JKV-IarNvMKJv85nmr5nyZis8
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/ui/authenticate.dart';
import 'package:prueba_jacobo/ui/views/sign_in_view.dart';
import 'package:prueba_jacobo/ui/views/sign_up_view.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';

import 'home_view.dart';
/*
class AuthWidget extends StatefulWidget {
  final AsyncSnapshot<User> userSnapshot; //User Data.
  AuthWidget({@required this.userSnapshot});
  @override
  _AuthWidgetState createState() =>
      _AuthWidgetState(userSnapshot: userSnapshot);
}

class _AuthWidgetState extends State<AuthWidget> {
  final AsyncSnapshot<User> userSnapshot; //User Data.
  bool showSignIn = true;
  _AuthWidgetState({@required this.userSnapshot});

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    //If the communication with Firebase is active, check if the user is authenticaded
    if (userSnapshot.connectionState == ConnectionState.active) {
      //Lead the user to HomeView or SignInView depending on his authentication state

      if (userSnapshot.hasData) {
        return HomeView();
      }
      return showSignIn ? SignInView(toggleView: toggleView,) : SignUpView(toggleView: toggleView,);
    }
    //If there's no connection with Firebase, return LoadingWidget
    print('Estoy aqui 2');
    return Scaffold(        
      body: LoadingWidget(),
    );
  }
}*/

class AuthWidget extends StatelessWidget {
  final AsyncSnapshot<User> userSnapshot; //User Data.
  AuthWidget({@required this.userSnapshot});

  @override
  Widget build(BuildContext context) {
    //If the communication with Firebase is active, check if the user is authenticaded
    if (userSnapshot.connectionState == ConnectionState.active) {
      //Lead the user to HomeView or SignInView depending on his authentication state

      return userSnapshot.hasData ? HomeView() : Authenticate();
    }
    //If there's no connection with Firebase, return LoadingWidget
    return Scaffold(
      body: LoadingWidget(),
    );
  }
}
