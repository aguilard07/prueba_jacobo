/**
 * Model of the bottomSheet widget that allows the user to
 * add a task in the firestore DB
 */

import 'package:flutter/material.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/base_model.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';

class AddTaskPanelModel extends BaseModel {
    FirestoreService _firestoreService;
    User _user;
    int taskColor; //Color of the border of the task tile.
    Color backGroundColor; //Background color of the panel that indicates the type of the new task.
    
    AddTaskPanelModel({@required FirestoreService firestoreService, @required User user}) {
        _user = user;
        _firestoreService = firestoreService;
        taskColor = 0;
        backGroundColor = panelBackgroundColors[0];
    }

    Future createTask(String taskDetails) async {
        var currentDate = DateTime.now();
        String month, day;

        //Formatting the date in to a more readable format MM/DD
        if(currentDate.month < 10) {
            month = "0${currentDate.month}";
        } else {
            month = currentDate.month.toString();
        }

        if(currentDate.day < 10) {
            day = "0${currentDate.day}";
        } else {
            day = currentDate.day.toString();
        }        
            


        String taskDate = "$month/$day";
        await _firestoreService.createTask(_user.uid, taskDetails, taskColor, taskDate);
    }

    void changeTaskColor(int colorCode){
        taskColor = colorCode;
        backGroundColor = panelBackgroundColors[colorCode];
        notifyListeners();
    }



}