import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/models/model/task.dart';
import 'package:prueba_jacobo/core/models/viewmodels/views/home_model.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';
import 'package:prueba_jacobo/ui/views/base_widget.dart';
import 'package:prueba_jacobo/ui/widgets/add_task_button.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';
import 'package:prueba_jacobo/ui/widgets/ntask_text.dart';
import 'package:prueba_jacobo/ui/widgets/task_list.dart';
import 'package:prueba_jacobo/ui/widgets/task_tile.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeModel>(
        model: HomeModel(
            firebaseAuthService: Provider.of(context),
            firestoreService: Provider.of(context),
            user: Provider.of(context)),
        onModelReady: (model) => model.getUserFromUid(),
        child: null,
        builder: (context, model, child)  => model.busy
            ? LoadingWidget()
            : StreamProvider<List<Task>>.value(
                value: model.getTaskStream(),
                  child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello ${model.username}!',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                        NTaskText()
                      ],
                    ),
                    //Appbar's gradient
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[gradientBlue2, gradientBlue1])),
                    ),
                    //Sign Out button
                    actions: <Widget>[
                      IconButton(
                        onPressed: model.signOut,
                        icon: Icon(Icons.exit_to_app),
                        iconSize: 25,
                      )
                    ],
                  ),
                  backgroundColor: Color(0xFFF9FCFF),
                  body: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 18.0),
                          // child: TaskTile(
                          //   text: "Prepare an arepa with fried pork",
                          //   borderColor: borderPink,
                          //   date: '02/05',
                          // ),
                          child: TaskList(),
                        ),
                        //Add-task button
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              child: AddTaskButton(
                                onPressed: () {
                                  model.showAddTaskPanel(context);
                                },
                              )),
                        )
                      ],
                    ),
                  )),
            ));
  }
}
