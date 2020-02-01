/*
 * Text Input widget with the style required by the 
 * UI design for the login and sign up forms. 
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';

class CustomTextFormInput extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  CustomTextFormInput(
      {this.hintText, this.obscureText, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 22,
        color: black1,
      ),
      cursorColor: black1,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCFCFCF)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCFCFCF)),
          )),
    );
  }
}
