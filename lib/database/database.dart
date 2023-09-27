import 'package:hive/hive.dart';

class TodoDataBase {
  //create todo list
  List toDoList = [];

  //reference hive box
  final _myBox = Hive.box("todo_db");

  //create init data when first time ever open app
  void createInitialData() {
    toDoList = [
      ["Việc 1", false],
      ["Việc 2", false],
    ];
  }

  //load data from hive
  void loadData() {
    toDoList = _myBox.get("todo_list");
  }

  //update data to hive
  void updateData() {
    _myBox.put("todo_list", toDoList);
  }
}
