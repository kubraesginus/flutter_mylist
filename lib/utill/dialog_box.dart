import 'package:flutter/material.dart';
import 'package:flutter_mylist/button/My_Button.dart';
import 'package:flutter_mylist/utill/app_colors.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(9.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppColors.mainpurplex),
      shadowColor: AppColors.mainpurplex,
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(child: Text("Add Task")),
      ),
      backgroundColor: Colors.white,
      content: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )),
                    hintText: "Add a new task",
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w700))),
            //buttons= save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
