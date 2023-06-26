import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _textController = TextEditingController();
  // list of the to do tiles
  List toDoList = [
    ["Make tutoral", false],
    ["Do exercise", false]
  ];

  // checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task

  saveNewTask() {
    setState(() {
      toDoList.add([_textController.text, false]);
    });
    Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("To Do App"),
        ),
        backgroundColor: Colors.yellow.shade200,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(
            size: 33,
            Icons.note_alt_outlined,
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
            );
          },
        ));
  }
}
