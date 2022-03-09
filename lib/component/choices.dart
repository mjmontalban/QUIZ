// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Choices extends StatefulWidget {
  final String answer;
  final Color answerColor;
  final VoidCallback answerTap;
  const Choices({Key? key, required this.answer, required this.answerColor, required this.answerTap})
      : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.answerTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.answerColor,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          widget.answer,
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
