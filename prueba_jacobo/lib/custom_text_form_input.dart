import 'package:flutter/material.dart';

import 'app_constants.dart';

class CustomTextFormInput extends StatelessWidget {
    
  FormFieldValidator<String> validator;
  final String hintText;
  final bool obscureText;  
  
  CustomTextFormInput({this.hintText, this.obscureText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,  
      keyboardType: TextInputType.emailAddress,
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
