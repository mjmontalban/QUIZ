// ignore_for_file: file_names, unused_field, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_final_fields, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:evsu_student/component/chewie.dart';
import 'package:evsu_student/screens/questions.dart';
class Watch extends StatefulWidget {
  final name, path;
  const Watch({Key? key, this.name, this.path}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  UniqueKey _uniqueKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Colors.red[900],
      ),
      body: LayoutBuilder(builder: (context, constraints) =>  Container(
            height: constraints.maxHeight,
            child: VideoScreen(
              path: widget.path,
              unique: _uniqueKey
          ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Question(
                subjectId : widget.name,
              )
            )
          );
        },
        label: const Text('Go To Exercise'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
