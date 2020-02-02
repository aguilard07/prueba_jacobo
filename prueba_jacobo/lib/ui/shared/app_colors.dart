/*
 * File that contains all the colors used in the
 * UI of the app. 
 */

import 'package:flutter/material.dart';

Color blue1 = Color(0xFF554E8F);
Color black1 = Color(0xFF373737);
Color blue2 = Color(0xFF82A0B7);

Color gradientBlue1 = Color(0xFF7EB6FF);
Color gradientBlue2 = Color(0xFF5F87E7);

Color gradientPink1 = Color(0xFFF857C3);
Color gradientPink2 = Color(0xFFE0139C);
Color shadowPink = Color(0xFFffa6f9);

Color borderYellow = Color(0xFFFFD506);
Color borderGreen = Color(0xFF1ED102);
Color borderBlue = Color(0xFF3044F2);
Color borderOrange = Color(0xFFF29130);
Color borderPink = Color(0xFFD10263);

Color taskTextBlue = Color(0xFF554E8F);

//Map of task-type colors
Map<int, Color> taskTypeColors = {
  0: borderYellow,
  1: borderGreen,
  2: borderBlue,
  3: borderOrange,
  4: borderPink
};

Map<int,Color> panelBackgroundColors = {
    0: Colors.yellow[300],
    1: Colors.green,
    2: Colors.blue,
    3: Colors.orange[300],
    4: Colors.pink[300]
};