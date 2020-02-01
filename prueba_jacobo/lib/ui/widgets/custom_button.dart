/*
 * Button for Login, Register and confirm task. 
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';

class CustomButton extends StatelessWidget {
  
  final VoidCallback onPressed;
  final String text;

  CustomButton({@required this.onPressed, @required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientBlue1, gradientBlue2],
          ),
          borderRadius: BorderRadius.circular(5.0)),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
