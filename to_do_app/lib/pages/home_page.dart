import 'package:flutter/material.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // if this is the 1st time ever opening in the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there are already exist data
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  // referance the box
  final _myBox = Hive.box("myBox");
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
