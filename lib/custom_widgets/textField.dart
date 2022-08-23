import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  customTextfield({
    required this.text,
    required this.ctrler,
    this.text2,
    required this.color,
    required this.bol,
  });

  bool bol;
  String text;
  String? text2;
  Color color;
  TextEditingController ctrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return "this field is required";
          }
        },
        cursorColor: Colors.white,
        controller: ctrler,
        obscureText: bol,
        decoration: InputDecoration(
            label: Text(
              text,
              style: TextStyle(color: color),
            ),
            hintText: text2,
            hintStyle: TextStyle(color: color),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color, width: 5)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: color)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: color))));
  }
}
