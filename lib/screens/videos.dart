// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:evsu_student/global/global.dart';
import 'package:evsu_student/screens/videoScreen.dart';
import 'package:flutter/widgets.dart';
var videoList = [
  {
    'name' : 'NUMBERS',
    'path' : '$apiUrl/lessons/NUMBERS.mp4',
    'thumbnail' : '$apiUrl/thumbnail/numbers.png',
    'color' : Colors.blueAccent,
    'icon' : FontAwesomeIcons.sortNumericUp
  },
  {
    'name' : 'SENSES',
    'path' : '$apiUrl/lessons/SENSES.mp4',
    'thumbnail' : '$apiUrl/thumbnail/senses.png',
    'color' : Colors.pink,
    'icon' : FontAwesomeIcons.userFriends
  },
  {
    'name' : 'COLORS',
    'path' : '$apiUrl/lessons/COLORS.mp4',
    'thumbnail' : '$apiUrl/thumbnail/colors.png',
    'color' : Colors.green,
    'icon' : FontAwesomeIcons.pencilRuler

  },
   {
    'name' : 'SHAPES',
    'path' : '$apiUrl/lessons/SHAPE.mp4',
    'thumbnail' : '$apiUrl/thumbnail/shape.jpeg',
    'color' : Colors.indigo,
    'icon' : FontAwesomeIcons.square
  }
];

class Videos extends StatefulWidget {
  const Videos({ Key? key }) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
        backgroundColor: Colors.red[900],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          margin: const EdgeInsets.only(top: 50.0,left: 20.0, right: 20.0),
          alignment: Alignment.center,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
            ),
            children: videoList.map((e) => GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Watch(
                    name : e['name'] ?? '',
                    path : e['path'] ?? ''
                  )
                )
              ),
          child: Container(
            decoration: BoxDecoration(
              color: e['color'] as Color,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                FaIcon(
                  e['icon'] as IconData,
                  color: Colors.white,
                  size: 80.0,
                ),
                const SizedBox(height: 12),
                Text(
                  e['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                )
              ],
            ),
          ),
        )).toList(),
          ),
        )
      )
    );
  }
}


