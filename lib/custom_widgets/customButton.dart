import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({required this.button});

  String button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        button,
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
