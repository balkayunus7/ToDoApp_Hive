import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/contants/constants.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.deleteFunction,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: _WidgetSize.cardPadSize.value(),
        left: _WidgetSize.cardPadSize.value(),
        right: _WidgetSize.cardPadSize.value(),
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete_outline_outlined,
            backgroundColor: ColorConstants.colorRedShade,
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(
            _WidgetSize.cardPadSize.value(),
          ),
          decoration: BoxDecoration(
              color: ColorConstants.colorYellow,
              borderRadius:
                  BorderRadius.circular(_WidgetSize.borderRadSize.value())),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: ColorConstants.colorBlack),
              // task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _WidgetSize { borderRadSize, cardPadSize }

// ignore: library_private_types_in_public_api
extension WidgetSizeExtension on _WidgetSize {
  double value() {
    switch (this) {
      case _WidgetSize.cardPadSize:
        return 25;

      case _WidgetSize.borderRadSize:
        return 12;
    }
  }
}
