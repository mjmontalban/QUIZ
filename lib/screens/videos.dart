import 'package:flutter/material.dart';
// import 'package:evsu_student/routes.dart';
import 'package:evsu_student/screens/videoScreen.dart';
var videoList = [
  {
    'name' : 'NUMBERS',
    'path' : 'assets/lessons/NUMBERS.mp4',
    'thumbnail' : 'http://192.168.1.15:88/evsu/numbers.png'
  },
  {
    'name' : 'SENSES',
    'path' : 'assets/lessons/SENSES.mp4',
    'thumbnail' : 'http://192.168.1.15:88/evsu/senses.png'
  },
  {
    'name' : 'COLORS',
    'path' : 'assets/lessons/COLORS.mp4',
    'thumbnail' : 'http://192.168.1.15:88/evsu/colors.png'
  },
   {
    'name' : 'SHAPES',
    'path' : 'assets/lessons/SHAPE.mp4',
    'thumbnail' : 'http://192.168.1.15:88/evsu/shape.jpeg'
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
      body: ListView(
        children: videoList.map((e) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Watch(
                name : e['name'] ?? '',
                path : e['path'] ?? ''
              )
            )
          ),
          child: Image.network(e['thumbnail'] ?? ''),
        )).toList(),
      ),
    );
  }
}
