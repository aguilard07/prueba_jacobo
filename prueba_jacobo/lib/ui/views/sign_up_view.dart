import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/constants/app_constants.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/sign_up_model.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';
import 'package:prueba_jacobo/ui/shared/validators.dart';
import 'package:prueba_jacobo/ui/views/base_widget.dart';
import 'package:prueba_jacobo/ui/widgets/custom_button.dart';
import 'package:prueba_jacobo/ui/widgets/custom_text_form_input.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';

class SignUpView extends StatefulWidget {
  final Function toggleView;
  SignUpView({this.toggleView});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); //Form's key.

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignUpModel>(
      model: SignUpModel(
          firebaseAuthService: Provider.of(context),
          firestoreService: Provider.of(context)),
      child: null,
      onModelReady: (model) => model.setBusy(false),
      builder: (context, model, child) {
        return Scaffold(
          body: model.busy
              ? LoadingWidget()
              : SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Center(
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
                                //First Name text field
                                CustomTextFormInput(
                                  validator: validateFullname,
                                  controller: _fullnameController,
                                  hintText: 'first name',
                                  obscureText: false,
                                ),
                                //Email text field
                                CustomTextFormInput(
                                  controller: _emailController,
                                  validator: validateEmail,
                                  hintText: 'email',
                                  obscureText: false,
                                ),
                                //Password text field
                                CustomTextFormInput(
                                  controller: _passwordController,
                                  validator: validatePassword,
                                  hintText: 'password',
                                  obscureText: true,
                                ),
                                //Confirm password text field
                                CustomTextFormInput(
                                  validator: (value) {
                                    return validateConfirmPassword(
                                        value, _passwordController.text);
                                  },
                                  controller: _confirmPasswordController,
                                  hintText: 'confirm password',
                                  obscureText: true,
                                ),
                                SizedBox(height: 45.0),
                                //SignUp button
                                CustomButton(
                                  text: 'Register',
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      await model.register(
                                          fullname: _fullnameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text);
                                      /*if (user != null) {
                                        Navigator.pushNamed(
                                            context, RoutePaths.Home);
                                      }
                                      model.setBusy(false);*/
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //FlatButton to navigate to SignUp
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80,
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
                                  widget.toggleView();
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: blue2,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
