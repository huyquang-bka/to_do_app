import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/database.dart';
import '../utils/todo_tile.dart';
import '../utils/dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reference box
  final _myBox = Hive.box("todo_db");
  TodoDataBase db = TodoDataBase();
  //text Controller
  final _textController = TextEditingController();

  @override
  void initState() {
    // if this is the first time ever app start
    if (_myBox.get("todo_list") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // check box change
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      if (_textController.text != "") {
        db.toDoList.add([_textController.text, false]);
        Navigator.of(context).pop();
        _textController.clear();
        db.updateData();
      }
    });
  }

  void cancelTask() {
    Navigator.of(context).pop();
    _textController.clear();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _textController,
            onSave: saveNewTask,
            onCancel: cancelTask,
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => {checkBoxChange(value, index)},
              deleteFuntion: (context) => deleteTask(index),
            );
          }),
    );
  }
}
