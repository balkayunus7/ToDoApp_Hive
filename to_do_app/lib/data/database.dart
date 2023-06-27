import 'package:hive/hive.dart';
import 'package:to_do_app/contants/constants.dart';

class ToDoDataBase {
  DatabaseConstants databaseConst = DatabaseConstants();

// referance the box
  final _myBox = Hive.box("myBox");

  // list of the to do tiles
  List toDoList = [];

  // run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      [databaseConst.defaultEx1, false],
      [databaseConst.defaultEx2, false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get(databaseConst.hiveKey);
  }

  // update the data from database
  void updateData() {
    _myBox.put(databaseConst.hiveKey, toDoList);
  }
}
