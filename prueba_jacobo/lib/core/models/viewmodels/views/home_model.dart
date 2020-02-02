import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/models/model/task.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';
import 'package:prueba_jacobo/core/models/viewmodels/base_model.dart';
import 'package:prueba_jacobo/core/services/firebase_auth_service.dart';
import 'package:prueba_jacobo/core/services/firestore_service.dart';
import 'package:prueba_jacobo/ui/widgets/add_task_panel.dart';

class HomeModel extends BaseModel {
  FirestoreService _firestoreService;
  FirebaseAuthService _firebaseAuthService;
  User _user;
  int ntasks;

  HomeModel(
      {@required FirestoreService firestoreService,
      @required User user,
      @required FirebaseAuthService firebaseAuthService}) {
    _firebaseAuthService = firebaseAuthService;
    _firestoreService = firestoreService;
    _user = user;
  }

  Stream<List<Task>> getTaskStream() => _firestoreService.getTasks(_user.uid);

  //Getter of tasks number
  Future<int> get taskNumber async {
    return await _firestoreService.getNtasks(_user.uid);
  }

  //Setter of ntasks

  void setNtasks(int value) {
    ntasks = value;
    notifyListeners();
  }

  String get username => _user.fullname;

  void getUserFromUid() async {
    setBusy(true);
    DocumentSnapshot userDoc =
        await _firestoreService.getUserFromUid(_user.uid);
    print(userDoc.data);
    ntasks = await taskNumber;
    print(ntasks);
    _user.fillElementsFromJson(userDoc.data);
    setBusy(false);
    notifyListeners();
  }

  //Show add task panel
  void showAddTaskPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => AddTaskPanel());
  }

  //SignOut method
  void signOut() async {
    setBusy(true);
    await _firebaseAuthService.signOut();
    setBusy(false);
    notifyListeners();
  }
}
