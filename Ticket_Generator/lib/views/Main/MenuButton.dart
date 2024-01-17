

import 'package:flutter/material.dart';
import '../../Services/DataService/Entities/TaskDB.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color color;
  final double width;
  final Color borderColor;
  final Function? dbAction;

  const MenuButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color = const Color.fromRGBO(255, 255, 255, 1),
    this.width = 150.0,
    this.borderColor = const Color.fromRGBO(255, 255, 255, 0),
    this.dbAction,
  }) : super(key: key);

  void _buttonAction() {
    if (onPressed != null) onPressed!();
    if (dbAction != null) dbAction!();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: width,
      child: TextButton(
        onPressed: _buttonAction,
        style: TextButton.styleFrom(
          backgroundColor: color.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            // set border color
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}