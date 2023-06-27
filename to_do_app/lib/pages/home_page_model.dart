import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'home_page.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/contants/constants.dart';

abstract class HomePageModel extends State<HomePage> {
  HomePageConstants homePageConstants = HomePageConstants();
  @override
  void initState() {
    // if this is the 1st time ever opening in the app, then create default data
    if (myBox.get(homePageConstants.hiveKey) == null) {
      db.createInitialData();
    } else {
      // there are already exist data
      db.loadData();
    }
    super.initState();
  }

  // referance the box
  final myBox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  // text controller
  final _textController = TextEditingController();

  // checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  saveNewTask() {
    setState(() {
      db.toDoList.add([_textController.text, false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _textController,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
}
