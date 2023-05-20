// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:clone_calculator/calculator.dart';

class roundButton extends StatelessWidget {
  final String btnName;
  final Color? bgColor;
  final Color? txtColor;
  final VoidCallback? callback;

  roundButton(
      {required this.btnName, this.txtColor, this.bgColor, this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!();
      },
      // onPressed: () {calculate(btnName)},
      child: Text(
        btnName,
        style: TextStyle(fontSize: 25, color: txtColor),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: bgColor,
      ),
    );
  }
}
