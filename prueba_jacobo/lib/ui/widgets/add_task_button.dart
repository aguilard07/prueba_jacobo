import 'package:flutter/material.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  AddTaskButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowPink,
              blurRadius: 5.0,
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[gradientPink1, gradientPink2]),
          borderRadius: BorderRadius.circular(27.5),
        ),
        child: Icon(
          Icons.add,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
