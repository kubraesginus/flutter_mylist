import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabese {
  List toDoList = [];

  final _mybox = Hive.box('mybox');

  void createInitData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
