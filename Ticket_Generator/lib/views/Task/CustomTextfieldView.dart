
import 'package:flutter/material.dart';

class CustomTextFieldView extends StatefulWidget {
  final Function(String) onTextChanged;

  const CustomTextFieldView({Key? key, required this.onTextChanged}) : super(key: key);

  @override
  CustomTextFieldViewState createState() => CustomTextFieldViewState();
}

class CustomTextFieldViewState extends State<CustomTextFieldView> {
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          setState(() {
            answer = value;
          });
          widget.onTextChanged(value);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(217, 217, 217, 0.1),
          contentPadding:
          EdgeInsets.only(bottom: 8.0, top: 8.0, left: 12.0, right: 12.0),
          isDense: true,
          border: InputBorder.none,
          // corner radius of 10.0
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.1)),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 0.1)),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        style: const TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    );
  }
}
