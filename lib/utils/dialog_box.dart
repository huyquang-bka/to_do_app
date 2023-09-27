import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  // on save
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //add new task input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(left: 5.0),
                labelText: "Task Name",
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              showCursor: true,
              cursorColor: Colors.black,
            ),
            //add button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //button save
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 5),
                //button cancel
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
