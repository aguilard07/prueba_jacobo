import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_jacobo/core/models/viewmodels/widgets/add_task_panel_model.dart';
import 'package:prueba_jacobo/ui/shared/app_colors.dart';
import 'package:prueba_jacobo/ui/views/base_widget.dart';
import 'package:prueba_jacobo/ui/widgets/custom_button.dart';
import 'package:prueba_jacobo/ui/widgets/loading_widget.dart';

class AddTaskPanel extends StatefulWidget {
  @override
  _AddTaskPanelState createState() => _AddTaskPanelState();
}

class _AddTaskPanelState extends State<AddTaskPanel> {
  final _formKey = GlobalKey<FormState>(); //Form's key.
  final _taskDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AddTaskPanelModel>(
      model: AddTaskPanelModel(firestoreService: Provider.of(context), user: Provider.of(context)),
      child: null,
      onModelReady: null,
      builder: (context, model, child) => model.busy
          ? LoadingWidget()
          : Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                  color: model.backGroundColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Add new task',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF404040),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _taskDetailsController,
                      autofocus: true,
                      maxLines: 3,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value.isEmpty) return "This field can't be empty";
                        return null;
                      },
                      decoration: InputDecoration(
                          errorStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
                          hintText: "Write here your task details...",
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none),
                      style:
                          TextStyle(fontSize: 20.0, color: Color(0xFF404040)),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            model.changeTaskColor(0);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: borderYellow,
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeTaskColor(1);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: borderGreen,
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeTaskColor(4);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: borderPink,
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeTaskColor(2);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: borderBlue,
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.changeTaskColor(3);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: borderOrange,
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      child: CustomButton(
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                             await model.createTask(_taskDetailsController.text);
                             Navigator.pop(context);
                          }
                        },
                        text: 'Add task',
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
