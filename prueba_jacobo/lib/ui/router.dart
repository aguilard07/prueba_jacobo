/*
 * Route generator that returns the correspond view
 * depending on the case. 
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/constants/app_constants.dart';
import 'package:prueba_jacobo/ui/views/home_view.dart';
import 'package:prueba_jacobo/ui/views/sign_in_view.dart';
import 'package:prueba_jacobo/ui/views/sign_up_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.SignIn:
        return MaterialPageRoute(builder: (_) => SignInView());
      case RoutePaths.SignUp:
        return MaterialPageRoute(builder: (_) => SignUpView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}