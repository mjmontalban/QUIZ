// ignore_for_file: prefer_const_constructors

import 'package:evsu_student/global/global.dart';
import 'package:flutter/material.dart';

class Choices extends StatefulWidget {
  final String answer;
  final Color answerColor;
  final VoidCallback answerTap;
  final double height;
  final double width;
  const Choices(
      {Key? key,
      required this.answer,
      required this.answerColor,
      required this.answerTap, required this.height, required this.width})
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
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.answerColor,
        ),
        child: Image.network(
          widget.answer,
           height: 200,
        )
      ),
    );
  }
}
