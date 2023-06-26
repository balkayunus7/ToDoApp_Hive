import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  final controller;
  DialogBox(
      {super.key,
      this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Add a new task", border: OutlineInputBorder()),
            ),

            //buttons => save / cancel

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 5),
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                )
                // cancel button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
