// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mylist/utill/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    var mainPink;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color.fromARGB(255, 218, 163, 241),
              borderRadius: BorderRadius.circular(14),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(21),
          decoration: BoxDecoration(
            color: AppColors.mainpurplex,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: AppColors.mainpurplex,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                focusColor: Color.fromARGB(255, 110, 109, 104),
                hoverColor: const Color.fromARGB(255, 255, 252, 252),
              ),

              //TASKNAME
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
