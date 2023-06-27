import 'package:flutter/material.dart';
import 'package:to_do_app/contants/constants.dart';
import 'package:to_do_app/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  DialogBox(
      {super.key,
      this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.colorYellowShade,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: DialogConstants.hintText,
                  border: const OutlineInputBorder()),
            ),

            //buttons => save / cancel

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                  text: DialogConstants.buttonSaveText,
                  onPressed: onSave,
                ),
                const SizedBox(width: 5),
                MyButton(
                  text: DialogConstants.buttonCancelText,
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
