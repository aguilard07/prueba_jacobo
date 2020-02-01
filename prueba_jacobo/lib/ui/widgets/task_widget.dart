import 'package:flutter/material.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';

class TaskWidget extends StatelessWidget {
  Color borderColor;
  String text;
  String date;

  TaskWidget({this.borderColor, this.text, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
            stops: [0.02, 0.02], colors: [borderBlue, Colors.white]),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              date,
              style: TextStyle(color: Colors.grey, fontSize: 11.0),
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
                height: 18.0,
                width: 180.0,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 14,
                      color: taskTextBlue,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              width: 25,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: gradientBlue1,
              ),
              iconSize: 24.0,
              onPressed: () {
                print('Boton presionado');
              },
            )
          ],
        ),
      ),
    );
  }
}
