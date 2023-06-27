import 'package:flutter/material.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:to_do_app/pages/home_page_model.dart';
import 'package:to_do_app/contants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomePageModel {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: _WidgetSize.elevationSize.value(),
          title: Text(homePageConstants.appText),
        ),
        backgroundColor: ColorConstants.colorYellowShade,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            size: _WidgetSize.iconSize.value(),
            Icons.note_alt_outlined,
          ),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              deleteFunction: (context) => deleteTask(index),
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
            );
          },
        ));
  }
}

enum _WidgetSize { iconSize, elevationSize }

// ignore: library_private_types_in_public_api
extension WidgetSizeExtension on _WidgetSize {
  double value() {
    switch (this) {
      case _WidgetSize.elevationSize:
        return 0;

      case _WidgetSize.iconSize:
        return 33;
    }
  }
}
