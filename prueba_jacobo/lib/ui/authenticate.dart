import 'package:flutter/material.dart';
import 'package:prueba_jacobo/ui/views/sign_in_view.dart';
import 'package:prueba_jacobo/ui/views/sign_up_view.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignInView(
            toggleView: toggleView,
          )
        : SignUpView(
            toggleView: toggleView,
          );
  }
}
