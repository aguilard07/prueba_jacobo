/*
 * Service class that allows to communicate the app
 * with the Cloud Firestore Database
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_jacobo/core/models/model/task.dart';
import 'package:prueba_jacobo/core/models/model/user.dart';

class FirestoreService {
  //Reference to users collection.
  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  //Method to create a user in the DB.
  Future createUser(User user) async {
    return await usersCollection.document(user.uid).setData(user.toJson());
  }

  //Method to obtain user info from its UID
  Future<DocumentSnapshot> getUserFromUid(String uid) async {
    return await usersCollection.document(uid).get();
  }

  //Method to add a task in the BD
  Future createTask(
      String userUid, String taskDetails, int taskColor, String date) async {
    return await usersCollection
        .document(userUid)
        .collection('tasks')
        .document()
        .setData(
            {"taskDetails": taskDetails, "taskColor": taskColor, "date": date});
  }

  //Get tasks stream
  Stream<List<Task>> getTasks(String userUid) {
    return usersCollection
        .document(userUid)
        .collection('tasks')
        .snapshots()
        .map(_taskListFromSnapshots);
  }

  //Get number of tasks
  Future<int> getNtasks(String userUid) async {
    var querySnapshot = await usersCollection
        .document(userUid)
        .collection('tasks')
        .getDocuments();
    int ntasks = querySnapshot.documents.length;
    return ntasks;
  }

  //Tasks list from snapshots

  List<Task> _taskListFromSnapshots(QuerySnapshot snapshots) {
    return snapshots.documents.map((doc) {
      return Task(
          date: doc.data["date"],
          text: doc.data["taskDetails"],
          colorCode: doc.data["taskColor"]);
    }).toList();
  }
}
