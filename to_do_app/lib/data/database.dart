import 'package:hive/hive.dart';

class ToDoDataBase {
// referance the box
  final _myBox = Hive.box("myBox");

  // list of the to do tiles
  List toDoList = [];

  // run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ["Make a tutorial", false],
      ["Do exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the data from database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
