import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/constants/app_constants.dart';
import 'package:prueba_jacobo/core/models/viewmodels/sign_in_model.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';
import 'package:prueba_jacobo/ui/shared/validators.dart';
import 'package:prueba_jacobo/ui/views/base_widget.dart';
import 'package:prueba_jacobo/ui/widgets/custom_button.dart';
import 'package:prueba_jacobo/ui/widgets/custom_text_form_input.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';

class SignInView extends StatefulWidget {
  final Function toggleView;
  SignInView({this.toggleView});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  //final _scaffoldKey = GlobalKey<ScaffoldState>(); //Scaffold's key
  final _formKey = GlobalKey<FormState>(); //Form's key.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignInModel>(
      model: SignInModel(firebaseAuthService: Provider.of(context)),
      child: null,
      onModelReady: (model) => model.setBusy(false),
      builder: (context, model, child) {
        return model.busy
            ? LoadingWidget()
            : Scaffold(
                body: Builder(
                  builder: (context) => SafeArea(
                    child: Stack(children: <Widget>[
                      Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ///Login's title
                                    Center(
                                      child: Text(
                                        'Login',
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
                                  ],
                                ),
                              ),
                              SizedBox(height: 45.0),
                              //Login button
                              CustomButton(
                                text: 'Login',
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await model.login(_emailController.text,
                                        _passwordController.text);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(color: blue2, fontSize: 17.0),
                              ),
                              FlatButton(
                                onPressed: () {
                                    widget.toggleView();
                                  /*Navigator.pushReplacementNamed(
                                      context, RoutePaths.SignUp);*/
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: blue2,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              );
      },
    );
  }
}
