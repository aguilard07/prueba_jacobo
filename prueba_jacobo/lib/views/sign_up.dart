import 'package:flutter/material.dart';
import 'package:prueba_jacobo/app_constants.dart';
import 'package:prueba_jacobo/custom_text_form_input.dart';
import 'package:prueba_jacobo/views/sign_in.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>(); //Form's key.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ///Login's title
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 22,
                        color: blue1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  //Email text field
                  CustomTextFormInput(
                    hintText: 'email',
                    obscureText: false,
                  ),
                  //Password text field
                  CustomTextFormInput(
                    hintText: 'password',
                    obscureText: true,
                  ),
                  //Confirm password text field
                  CustomTextFormInput(
                    hintText: 'confirm password',
                    obscureText: true,
                  ),
                  SizedBox(height: 45.0),
                  //FlatButton to navigate to SignUp
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: blue2, fontSize: 17.0),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SignIn()
                                )
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: blue2, 
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
