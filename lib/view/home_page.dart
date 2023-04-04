import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mylist/button/butondelete.dart';
import 'package:flutter_mylist/data/database.dart';
import 'package:flutter_mylist/utill/app_colors.dart';
import 'package:flutter_mylist/utill/dialog_box.dart';
import 'package:flutter_mylist/view/istatistic_view.dart';
import 'package:flutter_mylist/utill/todo_tile.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  ToDoDatabese db = ToDoDatabese();
  int pageIndex = 0;

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  List toDolist = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteAllTask() {
    setState(() {
      db.toDoList.clear();
      db.updateDatabase();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

//deletetask
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 204, 149, 252),
        color: AppColors.mainpurplex,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        buttonBackgroundColor: AppColors.mainpurplex,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.align_vertical_bottom_sharp,
            color: Colors.white,
          ),
        ],
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
          print("pageINdex $pageIndex");
        },
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Text(
          'TO DO LİST',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        elevation: 0,
        backgroundColor: AppColors.mainpurplex,
        centerTitle: true,
        actions: [
          pageIndex == 0
              ? DeleteButton(
                  text: "tümünü sil",
                  onpressed: () {
                    setState(() {
                      deleteAllTask();
                    });
                  },
                )
              : SizedBox(),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      floatingActionButton: pageIndex == 0
          ? FloatingActionButton(
              onPressed: createNewTask,
              backgroundColor: AppColors.mainpurplex,
              child: const Icon(Icons.add_box, color: Colors.white),
            )
          : null,
      body: pageIndex == 0
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            )
          : pageIndex == 1
              ? IstatisticView(
                  db: db,
                )
              : SizedBox(),
    );

    return scaffold;
  }
}
